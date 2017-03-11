#! /usr/bin/swift
import Foundation
let screen:Screen = Screen()
#if !os(Linux)
let pasteboard:Pasteboard = Pasteboard()
#endif
let condition: (member:[Character], length:Int, status:Int32) = Condition().get(arguments:CommandLine.arguments)
var passwd: String = ""
#if os(Linux)
let version: String = "mkpass ver.0.6.0L  2017.3.12  (c)Takeru.\n"
#else
let version: String = "mkpass ver.0.6.0  2017.2.18  (c)Takeru.\n"
#endif
let help: String = " Usage:\n      mkpass [c] [-u] [-l] [-n] [-s] [-x]\n      mkpass [c] [-a] [-x]\n      mkpass -h\n      mkpass -v\n\n Description:\n      The mkpass utility generates a password.\n      If auguments are not specified, length of password is 8.\n      and available characters are small alphabet and number.\n      Options to select characters are possible to combine.\n\n       c      Specify length of password.\n      -a      All characters are available.\n              This option has priority over other options.\n      -u      Capital alphabet characters are available.\n      -l      Small alphabet characters are available.\n      -n      Numeric characters are available.\n      -s      Symbol characters are available.\n      -x      Misleading characters (I1l|0O) are excluded.\n      -h      Display this credit.\n      -v      Display version.\n\n      Copyright (c) 2017 Takeru.\n      Released under the MIT license\n      http://opensource.org/licenses/MIT\n"
let error: String = "mkpass: Illegal option.\nFor more information, type 'mkpass -h'.\n"
if condition.status == 0 {
  passwd = Password().get(member:condition.member, length:condition.length)
  screen.write(message:passwd)
  #if !os(Linux)
  pasteboard.write(message:passwd)
  #endif
} else if condition.status == 1 {
  screen.write(message:version)
} else if condition.status == 2 {
  screen.write(message:"\(version)\n\(help)")
} else {
  screen.write(message:error)
}
exit(condition.status)
