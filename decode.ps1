param([int] $n=0, [switch] $l, [string] $rem)
#--------------------------------------------------------------------------
$credit = @"

  decode.ps1 ver.1.20  2017.1.28  (c)Takeru.

  Usage:
        decode.ps1 n [Remark]
        decode.ps1 -n [Remark]
        decode.ps1 -l

  Description:
        The decode utility maintains a password list.

         n      Decode password on specified line.
                If Remark is specified, Remark is added on log.
        -n      Remove password on specified line.
                If log has Remark, do not be removed.
                If Remark is specified, Remark is removed from log.
        -l      Display passwd.log.

        Copyright (c) 2017 Takeru.
        Release under the MIT license
        http://opensource.org/licenses/MIT

"@
#--------------------------------------------------------------------------
if ($l) {
  $count=0
  get-content ~/passwd.log | %{$line=$_; $count++;
  -join "["+$count+"] "+($line | %{$_ -split " "})[0]+" "+($line | %{$_ -split " "})[1]+" "+($line | %{$_ -split " "})[3]}
  return
}
if ($n -lt 0) {
  $count=0
  get-content ~/passwd.log | %{$line=$_; $count--;
    if (($n -ne $count) -or ((($line | %{$_ -split " "})[3]).length -gt 0)){
      if (($n -eq $count) -and ((($line | %{$_ -split " "})[3]) -eq $rem)){
        $line = (-join ($line -split " ")[0]+" "+($line -split " ")[1]+" "+($line -split " ")[2])
      }
      $line >> ~/passwd.tmp
    }
  }
  move-item -force ~/passwd.log ~/passwd.bak
  move-item -force ~/passwd.tmp ~/passwd.log
  return
}
if ($n -eq 0) {
  $credit
  return
}
if ([math]::abs($n) -gt (get-content ~/passwd.log).length) {
  "No exist."
  return
}
if (($rem).length -eq 0) {
  $datetime=((get-content ~/passwd.log | %{$_ -split "`n"})[$n - 1] | %{$_ -split " "})[0,1]
  $encript=((get-content ~/passwd.log | %{$_ -split "`n"})[$n - 1] | %{$_ -split " "})[2]
  $secure=ConvertTo-SecureString -String $encript
  $BSTR=[System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($secure)
  $passwd=[System.Runtime.InteropServices.Marshal]::PtrToStringBSTR($BSTR)
  -join $datetime[0]+" "+$datetime[1]+" "+$passwd
  $passwd | clip
}
else {
  $count=0
  get-content ~/passwd.log | %{$line=$_; $count++;
    if ($n -eq $count) {
      $line = (-join ($line -split " ")[0]+" "+($line -split " ")[1]+" "+($line -split " ")[2]+" "+$rem)
    }
    $line >> ~/passwd.tmp
  }
  move-item -force ~/passwd.log ~/passwd.bak
  move-item -force ~/passwd.tmp ~/passwd.log
  return
}
