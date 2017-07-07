#!/usr/bin/env python

import argparse
import glob
import os
import re
import shutil
import subprocess

def ensure_local_path_for(dest):
    path = os.path.dirname(dest)
    if not os.path.exists(path):
        os.makedirs(path)

def ensure_remote_path(user, host, path):
    subprocess.check_call(['ssh', '-t', '-t', user + '@' + host, 'mkdir -p "' + path + '"'])

def remote_md5sum(user, host, path):
    # note that 'md5sum *' fails if there are directories (which there are), so
    # we have to force success with '|| true'
    subprocess.check_call(['ssh', '-t', '-t', user + '@' + host, 'cd "' + path + '" && ( md5sum * > md5sums.txt || true )'])

def print_list(file_list):
    for (src, dest) in file_list:
        print(src + ' -> ' + dest)

def copy_list(file_list):
    for (src, dest) in file_list:
        print(src + ' -> ' + dest)
        ensure_local_path_for(dest)
        if os.path.isdir(src):
            shutil.copytree(src, dest)
        else:
            shutil.copy2(src, dest)

def scp_list(user, host, file_list):
    visited_paths = set()
    for (src, dest) in file_list:
        dest_spec = user + '@' + host + ':' + dest
        print(src + ' -> ' + dest_spec)
        path = os.path.dirname(dest)
        if not path in visited_paths:
            ensure_remote_path(user, host, path)
            visited_paths.add(path)
        subprocess.check_call(['scp', src, dest_spec])
    for path in visited_paths:
        remote_md5sum(user, host, path)

def archive_path(file_base, result_version):
    return os.path.join(file_base, 'archive', 'qtcreator', result_version)

def files_to_copy(file_base, installer_version, snapshot_version, result_version):
    installer_base = os.path.join(file_base, 'qtcreator', installer_version, 'installers', 'latest_available')
    snapshot_base = os.path.join(file_base, 'qtcreator', 'snapshots', snapshot_version, 'latest_successful')
    result_base = archive_path(file_base, result_version)

    def installer_files():
        src_files = glob.glob(os.path.join(installer_base, '*'))

        def result_installer_filepath(filepath):
            # rename opensource macOS installer so it can be replaced with the non-installer package
            replacement = r'_installer\1' if 'opensource-mac' in filepath else r'\1'
            newfilename = re.sub(r'_[0-9]*([.](exe|run|dmg))', replacement, os.path.basename(filepath))
            return os.path.join(result_base, newfilename)

        return [(fp, result_installer_filepath(fp)) for fp in src_files]

    def snapshot_files():
        src_files = glob.glob(os.path.join(snapshot_base, '*'))
        return [(fp, os.path.join(result_base, os.path.basename(fp))) for fp in src_files]

    return installer_files() + snapshot_files()

def short_version(version):
    match = re.match(r'[0-9]+[.][0-9]+', version)
    return match.group() if match else version

def files_to_scp(file_base, version, server_base):
    src_base = archive_path(file_base, version)
    server_prefix = server_base + '/qtcreator/' + short_version(version) + '/.' + version
    # open source "installer" files and source files, but without the _installer file on macOS
    files = [fp for fp in glob.glob(os.path.join(src_base, '*opensource*')) if not '_installer' in fp]
    # 7zips
    directories = (glob.glob(os.path.join(src_base, 'linux_*')) +
                   glob.glob(os.path.join(src_base, 'mac_*')) +
                   glob.glob(os.path.join(src_base, 'windows_*')))
    zipfile_candidates = [os.path.join(d, f)
                          for d in directories
                          for f in ['qtcreator.7z', 'qtcreator_dev.7z', 'qtcreatorcdbext.7z', 'wininterrupt.7z']]
    zipfiles = filter(os.path.exists, zipfile_candidates)
    file_list = [(fp, fp.replace(src_base, server_prefix)) for fp in files]
    return file_list + [(fp, fp.replace(src_base, server_prefix + '/installer_source')) for fp in zipfiles]

def getArgs():
    parser = argparse.ArgumentParser(description='Publish Qt Creator builds')
    parser.add_argument('--display-version', required=True,
        help='Result display version, e.g. "4.3.0-rc1"')
    parser.add_argument('--installer-version', required=True,
        help='Version used in the path to the installer binaries, e.g. 4.3.0')
    parser.add_argument('--snapshot-version', required=True,
        help='Version used in the path to the snapshot build, e.g. 4.3.0-rc1_58x')
    return parser.parse_args()

def main():
    args = getArgs()
    file_base = '/srv/jenkins_data'
    server_user = 'digia'
    server_host = 'master.qt.io'
    server_path = '/data/pub/qtproject/official_releases'
    to_copy = files_to_copy(file_base, args.installer_version, args.snapshot_version, args.display_version)
    copy_list(to_copy)
    to_scp = files_to_scp(file_base, args.display_version, server_path)
    scp_list(server_user, server_host, to_scp)

if __name__ == '__main__':
    main()
