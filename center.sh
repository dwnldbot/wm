#!/bin/sh

test -z "$1" && echo "usage: $(basename $0) <wid>" && exit 1

ROOT=$(lsw -r)

RWW=$(wattr w $ROOT)
RWH=$(wattr h $ROOT)
CWW=$(wattr w $1)
CWH=$(wattr h $1)

wtp $(( ($RWW - $CWW) / 2)) $(( ($RWH - $CWH) / 2)) $CWW $CWH $1
