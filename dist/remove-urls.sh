#!/bin/sh
#
# $COPYRIGHT$
#
# $Id$
#

files="$*"

if test "$files" != ""; then
  for file in $files; do
    str="rm -f `basename $file`"
    echo $str
    eval $str
  done
fi

exit 0
