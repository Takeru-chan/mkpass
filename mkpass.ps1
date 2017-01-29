param([switch] $a, [switch] $h, [switch] $u, [switch] $l, [switch] $n, [switch] $s, [int] $c=8)
#--------------------------------------------------------------------------
$credit = @"

  mkpass.ps1 ver.1.11  2017.1.29  (c)Takeru.

  Usage:
        mkpass.ps1 [c] [-u] [-l] [-n] [-s]
        mkpass.ps1 -h

  Description:
        The mkpass utility generates a password.
        If arguments are not specified, length of password is 8
        and available characters are small alphabet and number.
        Options to select characters are possible to combine.

         c      Specify the length of password.
        -a      All characters are available.
                This option has priority over other options.
        -u      Capital alphabet characters are available.
        -l      Small alphabet characters are available.
        -n      Numeric characters are available.
        -s      Symbol characters are available.
        -h      Display this credit.

        Copyright (c) 2017 Takeru.
        Release under the MIT license
        http://opensource.org/licenses/MIT

"@
#--------------------------------------------------------------------------
$member=@()
if ($h) {
  $credit
  return
}
if ($u) {
  $member+=(65..90)
}
if ($l) {
  $member+=(97..122)
}
if ($n) {
  $member+=(48..57)
}
if ($s) {
  $member+=(33..47)+(58..64)+(91..96) +(123..126)
}
if ($a) {
  $member=(33..126)
}
if ($member.length -eq 0) {
  $member=(97..122+48..57)
}
$passwd=""
foreach ($count in 1..$c) {
  $passwd=$passwd+$(Get-Random -input ($member | %{[char]$_}))
}
$passwd
$passwd | clip
$secure=convertfrom-securestring -securestring (convertto-securestring $passwd -asplaintext -force)
(get-date -uformat "%Y/%m/%d %H:%M:%S")+" "+$secure >> ~/passwd.log
