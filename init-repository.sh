#!/bin/sh
git submodule update --init --recursive

cd qtcreator
git checkout --track origin/6.0
gitdir=$(git rev-parse --git-dir); scp -P 29418 codereview.qt-project.org:hooks/commit-msg ${gitdir}/hooks/
cd ..
cd qtquickdesigner
git checkout --track origin/6.0
gitdir=$(git rev-parse --git-dir); scp -P 29418 codereview.qt-project.org:hooks/commit-msg ${gitdir}/hooks/
cd ..
cd telemetry
git checkout --track origin/6.0
gitdir=$(git rev-parse --git-dir); scp -P 29418 codereview.qt-project.org:hooks/commit-msg ${gitdir}/hooks/
cd ..
