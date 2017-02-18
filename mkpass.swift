#! /usr/bin/swift
import Foundation
let screen:Screen = Screen()
let pasteboard:Pasteboard = Pasteboard()
let condition: (member:[Character], length:Int, status:Int32) = Condition().get(arguments:CommandLine.arguments)
var passwd: String = ""
if condition.status == 0 {
  passwd = Password().get(member:condition.member, length:condition.length)
  screen.write(message:passwd)
  pasteboard.write(message:passwd)
} else {
  screen.write(message:"option error!")
}
exit(condition.status)
