#!/bin/bash

REVISION_RANGE="$1"

#set -x

# git fetch origin
git log "${REVISION_RANGE}" | grep "^Author: " | cut -d' ' -f2- | sort -u --ignore-case \
    | sed -e "s/@digia.com>/@theqtcompany.com>/i" \
    | sed -e "s/@theqtcompany.com>/@qt.io>/i" \
    | sed -e "s/^The Qt Project.*//i" \
    \
    | sed -e "s/^.*<erik.verbruggen@qt.io>/Erik Verbrüggen/i" \
    | sed -e "s/^.*<kai.koehne@qt.io>.*/Kai Köhne/i" \
    | sed -e "s/^.*<kakoehne@linux-k5ea.home>/Kai Köhne/i" \
    | sed -e "s/^.*<hjk121@nokiamail.com>.*$/André Pönitz/i" \
    | sed -e "s/^.*<hjk@qt.io>.*$/André Pönitz/i" \
    | sed -e "s/^.*<robert.loehning@qt.io>.*$/Robert Löhning/i" \
    | sed -e "s/^.*<jaroslaw.kobus@qt.io>.*$/Jaroslaw Kobus/i" \
    | sed -e "s/^.*<joerg.bornemann@qt.io>.*$/Jörg Bornemann/i" \
    | sed -e "s/^.*<karsten.heimrich@qt.io>.*$/Karsten Heimrich/i" \
    | sed -e "s/^.*<no.smile.face@gmail.com>.*$/Evgenly Stepanov/i" \
    | sed -e "s/^.*<hluk@email.cz>.*$/Lukas Holecek/i" \
    | sed -e "s/^.*<cristian.maureira-fredes@qt.io>.*$/Cristián Maureira-Fredes/i" \
    \
    | sed -e "s/ <.*$//" \
    | sed -e "s/$/  /" \
    | sort -u --ignore-case

