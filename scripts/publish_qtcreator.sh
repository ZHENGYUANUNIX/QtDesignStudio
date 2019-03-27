#!/bin/bash

# Runs the publishing script on the servers (QT@ci-files02-hki.ci.local)

HERE=`dirname $0`
# 3x arguments with value + 1x argument = 7
if [[ "$#" != 7 ]]; then
    "$HERE/impl_publish_qtcreator.py" -h
else
    ssh QT@ci-files02-hki.ci.local python - < "$HERE/impl_publish_qtcreator.py" "$@"
fi
