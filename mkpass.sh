#!/bin/sh - 
# @(#) mkpass.sh ver.0.6.0  2017.1.15  (c)Takeru.
#
# Usage:
#      mkpass.sh [c] [-u] [-l] [-n] [-s] [-x]
#      mkpass.sh [c] [-a] [-x]
#      mkpass.sh -h
#      mkpass.sh -v
#
# Description:
#      The mkpass utility generates a password.
#      If auguments are not specified, length of password is 8.
#      and available characters are small alphabet and number.
#      Options to select characters are possible to combine.
#
#       c      Specify length of password.
#      -a      All characters are available.
#              This option has priority over other options.
#      -u      Capital alphabet characters are available.
#      -l      Small alphabet characters are available.
#      -n      Numeric characters are available.
#      -s      Symbol characters are available.
#      -x      Misleading characters (I1l|0O) are excluded.
#      -h      Display this credit.
#      -v      Display version.
#
#      Copyright (c) 2017 Takeru.
#      Released under the MIT license
#      http://opensource.org/licenses/MIT
#
#######################################################################
set -o nounset                              # Treat unset variables as an error

error="\\nFor more information, type \"$0 -h\".\\n"
if test $# -gt 6; then
  echo $0: Too many options.$error
  exit 1
fi
member=""
exclude="[:blank:]"
count=8
if test $# -gt 0; then
  for n in `seq 1 $#`
  do
    option=`echo $@ | cut -d ' ' -f $n`
    case $option in
      -a) member="[:graph:]";;
      -u) member="${member}[:upper:]";;
      -l) member="${member}[:lower:]";;
      -n) member="${member}[:digit:]";;
      -s) member="${member}[:punct:]";;
      -x) exclude="${exclude}I1l|0O";;
      -h) head -30 $0 | tail -29 | sed 's/^#//'; exit 0;;
      -v) head -3 $0 | tail -2 | sed 's/^#//'; exit 0;;
       *) expr $option + 1 > /dev/null 2>&1
          if test $? -lt 2; then
            if test $option -ne 0; then
              count=$option
            else
              count=8
            fi
          else
            echo $0: Illegal option.$error
            exit 1
          fi;;
    esac
  done
fi
length=`echo $member | wc -w`
if test $length -eq 0; then
  member="[:lower:][:digit:]"
fi
env LC_CTYPE=C tr -dc "$member" </dev/urandom | tr -d "$exclude" | fold -w $count | head -1
