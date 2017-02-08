#!/bin/sh
set -x

srcdir=`dirname $0`
test -z "$srcdir" && srcdir=.

THEDIR=`pwd`
cd $srcdir

AUTOMAKE=${AUTOMAKE:-automake} ACLOCAL=${ACLOCAL:-aclocal}
export AUTOMAKE ACLOCAL
${AUTORECONF:-autoreconf} -i
find . \( -name 'run*' -o -name '*.sh' \) -a -type f | xargs chmod +x
chmod +x scripts/*
cd $THEDIR
