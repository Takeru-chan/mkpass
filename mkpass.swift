#! /usr/bin/swift
import Foundation
let screen:Screen = Screen()
let pasteboard:Pasteboard = Pasteboard()
var returnSet: (member:[Character], length:Int, status:Int32) = Condition().get()
var passwd: String = ""
if returnSet.status == 0 {
  for n in 1...returnSet.length {
    var code: UInt32  = arc4random_uniform(UInt32(returnSet.member.count))
    passwd += "\(returnSet.member[Int(code)])"
  }
  screen.write(message:passwd)
  pasteboard.write(message:passwd)
} else {
  screen.write(message:"option error!")
}
exit(returnSet.status)
