#!/bin/bash

# Runs the publishing script on the servers (QT@ci-files02-hki.ci.local)

HERE=`dirname $0`
ssh QT@ci-files02-hki.ci.local python - < "$HERE/impl_publish_qtcreator.py" "$@"
