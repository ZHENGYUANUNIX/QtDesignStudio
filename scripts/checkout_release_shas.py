#!/usr/bin/env python

import argparse
import os
import subprocess
import urllib2

def checkout_shas(repo_shas):
    base = os.getcwd()
    for sha in repo_shas:
        subprocess.check_call(['git', 'checkout', sha[1]],
                               cwd=os.path.join(base, sha[0]))

def mapped_module(module):
    mapping = {
        "appmanagerintegration": "qtapplicationmanagerintegration",
        "b2qt-qtcreator-plugin": "boot2qt",
        "isoiconbrowser": "qtquickdesigner",
        "vxworks-qtcreator-plugin": "vxworks",
        "qt-creator": "qtcreator"
    }
    if module in mapping:
        return mapping[module]
    return module

def get_shas(url):
    url_file = urllib2.urlopen(url)
    lines = url_file.readlines()
    split_lines = [line.split(':') for line in lines]
    return [(mapped_module(items[0].strip()), items[1].strip()) for items in split_lines]

def get_args():
    parser = argparse.ArgumentParser(description='Checkout submodule SHA1s corresponding to a packaging build')
    parser.add_argument('sha_url', help='URL for the SHA1 file of the build')
    return parser.parse_args()

def main():
    args = get_args()
    repo_shas = get_shas(args.sha_url)
    checkout_shas(repo_shas)

if __name__ == '__main__':
    main()
