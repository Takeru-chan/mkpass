#! /usr/bin/swift
import Foundation
import Cocoa
let arguments: [String] = CommandLine.arguments
var returnSet: (flag:[Bool], exclude:Bool, length:Int, status:Int)
var member: [String] = []
let range:[[[Int]]] = [[[65,90]],[[97,122]],[[48,57]],[[33,47],[58,64],[91,96],[123,126]]]
var exclude:[[Int]] = [[14,8],[11],[1,0],[29]]
returnSet = CheckOption(arguments: arguments).getOption()
if !(returnSet.flag[0] || returnSet.flag[1] || returnSet.flag[2] || returnSet.flag[3]) {
	returnSet.flag[1] = true
	returnSet.flag[2] = true
}
if returnSet.length == 0 {
  returnSet.length = 8
}
for n in 0...3 {
	if (returnSet.flag[n]) {
		if !(returnSet.exclude) {
			exclude[n] = []
		}
	member += GenerateMember().getMember(range: range[n], exclude: exclude[n])
	}
}
var passwd: String = ""
for n in 1...returnSet.length {
  var code: UInt32  = arc4random_uniform(UInt32(member.count))
  passwd += member[Int(code)]
}
print(passwd)
let board = NSPasteboard.general()
board.clearContents()
let item = NSPasteboardItem()
item.setString(passwd, forType: NSPasteboardTypeString)
board.writeObjects([item])
