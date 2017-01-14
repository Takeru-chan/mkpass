#!/bin/sh - 
# @(#) mkpass.sh ver.0.5.0  2017.1.14  (c)Takeru.
#
# Usage:
#      mkpass.sh [c] [-u] [-l] [-n] [-s]
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
#      -u      Capital alphabet characters are available.
#      -l      Small alphabet characters are available.
#      -n      Numeric characters are available.
#      -s      Symbol characters are available.
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
if test $# -gt 5; then
  echo $0: Too many options.$error
  exit 1
fi
member=""
passwd=""
count=8
upper="A B C D E F G H I J K L M N O P Q R S T U V W X Y Z"
lower="a b c d e f g h i j k l m n o p q r s t u v w x y z"
number="0 1 2 3 4 5 6 7 8 9"
symbol="\" % & ' ( ) ++ + , - . / : ; < = > ? @ [ \\ ] ^ _ \` { | } ~"
# アスタリスクは展開されてしまうので一旦++で代用
if test $# -gt 0; then
  for n in `seq 1 $#`
  do
    option=`echo $@ | cut -d ' ' -f $n`
    case $option in
      -a) member="$upper $lower $number $symbol";;
      -u) member="$member $upper";;
      -l) member="$member $lower";;
      -n) member="$member $number";;
      -s) member="$member $symbol";;
      -h) head -27 $0 | tail -26 | sed 's/^#//'; exit 0;;
      -v) head -3 $0 | tail -2 | sed 's/^#//'; exit 0;;
       *) expr $option + 1 > /dev/null 2>%1
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
  member="$lower $number"
fi
length=`echo $member | wc -w`
for n in `seq 1 $count`
do
  code=`echo $member | cut -d ' ' -f $(($(od -vAn -tu4 -N4 /dev/urandom) % $length + 1))`
  code=`echo $code | sed 's/++/*/'`
  passwd=$passwd$code
done
echo $passwd
