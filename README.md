
Prerequisites:
--------------
* Git version 2.10 or later  
  For the `submodule --remote` option, which makes git pull the latest `HEAD`
  of the right branch for the submodules, instead of a fixed commit, and
  for the `branch = .` entry in `.gitmodules`.

* Qt5  
  The only supported Qt major version for this repository's .pro file.

Initializing:
-------------
```
git checkout <qtcreatorbranch>
git submodule update --init --remote
cd qtcreator
git submodule update --init
cd ..
```

Updating:
---------
```
git pull --rebase
git submodule update --remote --rebase
cd qtcreator
git submodule update
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

Do not change anything in this governing `qtcreator-super` repository, it is
set up to update all submodules to the `HEAD` of the right branch
(when using `--remote`).
