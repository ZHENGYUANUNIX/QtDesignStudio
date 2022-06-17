# Qt Design Studio Super Repository
Prerequisites:
--------------
* Git version 2.10 or later  
  For the `submodule --remote` option, which makes git pull the latest `HEAD`
  of the right branch for the submodules, instead of a fixed commit, and
  for the `branch = .` entry in `.gitmodules`.

Initializing:
-------------
clone repository from https://codereview.qt-project.org/admin/repos/qt-creator/tqtc-qtc-super
```
git checkout --track origin/qds-stable
git submodule update --init --remote --recursive
git -C qtcreator checkout --track origin/7.0
```

Updating:
---------
```
git pull --rebase
git submodule update --remote --rebase
cd qtcreator
git submodule update --recursive
cd ..
```

`qt-creator` is pulled from the mirror at `code.qt.io`, which is updated with
a short delay.

Working:
--------
Work in the corresponding submodule.

For Qt Creator, you must add the gerrit remote and push there:
```
cd qtcreator
git remote add gerrit ssh://codereview.qt-project.org/qt-creator/qt-creator
```

Download and install the commit hook from 

http://codereview.qt-project.org/tools/hooks

to the module where you want to change something
for example in qtcreator:
.git/modules/qtcreator/hooks

Do not change anything in this governing `qtcreator-super` repository, it is
set up to update all submodules to the `HEAD` of the right branch
(when using `--remote`).
