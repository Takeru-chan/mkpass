#! /bin/sh
printf "No option -> "
temp=`./test-Condition`
if test "$temp" = "abcdefghijklmnopqrstuvwxyz0123456789-8-0"; then
  echo OK
else
  echo $temp
fi
printf "Specified correct length(10) -> "
temp=`./test-Condition 10`
if test "$temp" = "abcdefghijklmnopqrstuvwxyz0123456789-10-0"; then
  echo OK
else
  echo $temp
fi
printf "Specified invalild length(-10) -> "
temp=`./test-Condition -10`
if test "$temp" = "-0-1"; then
  echo OK
else
  echo $temp
fi
printf "Specified invalild length(0.5) -> "
temp=`./test-Condition 0.5`
if test "$temp" = "-0-1"; then
  echo OK
else
  echo $temp
fi
printf "Specified duplicated length(10 5) -> "
temp=`./test-Condition 10 5`
if test "$temp" = "abcdefghijklmnopqrstuvwxyz0123456789-5-0"; then
  echo OK
else
  echo $temp
fi
printf "Specified correct switch(-a) -> "
temp=`./test-Condition -a`
if test "$temp" = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!\"#$%&'()*+,-./:;<=>?@[\]^_\`{|}~-8-0"; then
  echo OK
else
  echo $temp
fi
printf "Specified correct switch(-ax) -> "
temp=`./test-Condition -ax`
if test "$temp" = "ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz23456789!\"#$%&'()*+,-./:;<=>?@[\]^_\`{}~-8-0"; then
  echo OK
else
  echo $temp
fi
printf "Specified correct switch(-a -x) -> "
temp=`./test-Condition -a -x`
if test "$temp" = "ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz23456789!\"#$%&'()*+,-./:;<=>?@[\]^_\`{}~-8-0"; then
  echo OK
else
  echo $temp
fi
printf "Specified correct switch(-u) -> "
temp=`./test-Condition -u`
if test "$temp" = "ABCDEFGHIJKLMNOPQRSTUVWXYZ-8-0"; then
  echo OK
else
  echo $temp
fi
printf "Specified correct switch(-ux) -> "
temp=`./test-Condition -ux`
if test "$temp" = "ABCDEFGHJKLMNPQRSTUVWXYZ-8-0"; then
  echo OK
else
  echo $temp
fi
printf "Specified correct switch(-u -x) -> "
temp=`./test-Condition -u -x`
if test "$temp" = "ABCDEFGHJKLMNPQRSTUVWXYZ-8-0"; then
  echo OK
else
  echo $temp
fi
printf "Specified correct switch(-l) -> "
temp=`./test-Condition -l`
if test "$temp" = "abcdefghijklmnopqrstuvwxyz-8-0"; then
  echo OK
else
  echo $temp
fi
printf "Specified correct switch(-lx) -> "
temp=`./test-Condition -lx`
if test "$temp" = "abcdefghijkmnopqrstuvwxyz-8-0"; then
  echo OK
else
  echo $temp
fi
printf "Specified correct switch(-l -x) -> "
temp=`./test-Condition -l -x`
if test "$temp" = "abcdefghijkmnopqrstuvwxyz-8-0"; then
  echo OK
else
  echo $temp
fi
printf "Specified correct switch(-n) -> "
temp=`./test-Condition -n`
if test "$temp" = "0123456789-8-0"; then
  echo OK
else
  echo $temp
fi
printf "Specified correct switch(-nx) -> "
temp=`./test-Condition -nx`
if test "$temp" = "23456789-8-0"; then
  echo OK
else
  echo $temp
fi
printf "Specified correct switch(-n -x) -> "
temp=`./test-Condition -n -x`
if test "$temp" = "23456789-8-0"; then
  echo OK
else
  echo $temp
fi
printf "Specified correct switch(-s) -> "
temp=`./test-Condition -s`
if test "$temp" = "!\"#$%&'()*+,-./:;<=>?@[\]^_\`{|}~-8-0"; then
  echo OK
else
  echo $temp
fi
printf "Specified correct switch(-sx) -> "
temp=`./test-Condition -sx`
if test "$temp" = "!\"#$%&'()*+,-./:;<=>?@[\]^_\`{}~-8-0"; then
  echo OK
else
  echo $temp
fi
printf "Specified correct switch(-s -x) -> "
temp=`./test-Condition -s -x`
if test "$temp" = "!\"#$%&'()*+,-./:;<=>?@[\]^_\`{}~-8-0"; then
  echo OK
else
  echo $temp
fi
printf "Specified correct switch(-x) -> "
temp=`./test-Condition -x`
if test "$temp" = "abcdefghijkmnopqrstuvwxyz23456789-8-0"; then
  echo OK
else
  echo $temp
fi
printf "Specified invalild switch(-A) -> "
temp=`./test-Condition -A`
if test "$temp" = "-0-1"; then
  echo OK
else
  echo $temp
fi
printf "Specified correct switch(-a) and length(10) -> "
temp=`./test-Condition -a 10`
if test "$temp" = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!\"#$%&'()*+,-./:;<=>?@[\]^_\`{|}~-10-0"; then
  echo OK
else
  echo $temp
fi
