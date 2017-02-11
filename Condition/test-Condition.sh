#! /bin/sh
printf "No option -> "
temp=`./test-Condition`
if test "$temp" = "(false, true, true, false, false, 8, 0)"; then
  echo OK
else
  echo $temp
fi
printf "Specified correct length(10) -> "
temp=`./test-Condition 10`
if test "$temp" = "(false, true, true, false, false, 10, 0)"; then
  echo OK
else
  echo $temp
fi
printf "Specified invalild length(-10) -> "
temp=`./test-Condition -10`
if test "$temp" = "(false, true, true, false, false, 8, 1)"; then
  echo OK
else
  echo $temp
fi
printf "Specified invalild length(0.5) -> "
temp=`./test-Condition 0.5`
if test "$temp" = "(false, true, true, false, false, 8, 1)"; then
  echo OK
else
  echo $temp
fi
printf "Specified duplicated length(10 5) -> "
temp=`./test-Condition 10 5`
if test "$temp" = "(false, true, true, false, false, 5, 0)"; then
  echo OK
else
  echo $temp
fi
printf "Specified correct switch(-a) -> "
temp=`./test-Condition -a`
if test "$temp" = "(true, true, true, true, false, 8, 0)"; then
  echo OK
else
  echo $temp
fi
printf "Specified correct switch(-ax) -> "
temp=`./test-Condition -ax`
if test "$temp" = "(true, true, true, true, true, 8, 0)"; then
  echo OK
else
  echo $temp
fi
printf "Specified correct switch(-a -x) -> "
temp=`./test-Condition -a -x`
if test "$temp" = "(true, true, true, true, true, 8, 0)"; then
  echo OK
else
  echo $temp
fi
printf "Specified correct switch(-u) -> "
temp=`./test-Condition -u`
if test "$temp" = "(true, false, false, false, false, 8, 0)"; then
  echo OK
else
  echo $temp
fi
printf "Specified correct switch(-ux) -> "
temp=`./test-Condition -ux`
if test "$temp" = "(true, false, false, false, true, 8, 0)"; then
  echo OK
else
  echo $temp
fi
printf "Specified correct switch(-u -x) -> "
temp=`./test-Condition -u -x`
if test "$temp" = "(true, false, false, false, true, 8, 0)"; then
  echo OK
else
  echo $temp
fi
printf "Specified correct switch(-l) -> "
temp=`./test-Condition -l`
if test "$temp" = "(false, true, false, false, false, 8, 0)"; then
  echo OK
else
  echo $temp
fi
printf "Specified correct switch(-lx) -> "
temp=`./test-Condition -lx`
if test "$temp" = "(false, true, false, false, true, 8, 0)"; then
  echo OK
else
  echo $temp
fi
printf "Specified correct switch(-l -x) -> "
temp=`./test-Condition -l -x`
if test "$temp" = "(false, true, false, false, true, 8, 0)"; then
  echo OK
else
  echo $temp
fi
printf "Specified correct switch(-n) -> "
temp=`./test-Condition -n`
if test "$temp" = "(false, false, true, false, false, 8, 0)"; then
  echo OK
else
  echo $temp
fi
printf "Specified correct switch(-nx) -> "
temp=`./test-Condition -nx`
if test "$temp" = "(false, false, true, false, true, 8, 0)"; then
  echo OK
else
  echo $temp
fi
printf "Specified correct switch(-n -x) -> "
temp=`./test-Condition -n -x`
if test "$temp" = "(false, false, true, false, true, 8, 0)"; then
  echo OK
else
  echo $temp
fi
printf "Specified correct switch(-s) -> "
temp=`./test-Condition -s`
if test "$temp" = "(false, false, false, true, false, 8, 0)"; then
  echo OK
else
  echo $temp
fi
printf "Specified correct switch(-sx) -> "
temp=`./test-Condition -sx`
if test "$temp" = "(false, false, false, true, true, 8, 0)"; then
  echo OK
else
  echo $temp
fi
printf "Specified correct switch(-s -x) -> "
temp=`./test-Condition -s -x`
if test "$temp" = "(false, false, false, true, true, 8, 0)"; then
  echo OK
else
  echo $temp
fi
printf "Specified correct switch(-x) -> "
temp=`./test-Condition -x`
if test "$temp" = "(false, true, true, false, true, 8, 0)"; then
  echo OK
else
  echo $temp
fi
printf "Specified invalild switch(-A) -> "
temp=`./test-Condition -A`
if test "$temp" = "(false, true, true, false, false, 8, 1)"; then
  echo OK
else
  echo $temp
fi
printf "Specified correct switch(-a) and length(10) -> "
temp=`./test-Condition -a 10`
if test "$temp" = "(true, true, true, true, false, 10, 0)"; then
  echo OK
else
  echo $temp
fi
