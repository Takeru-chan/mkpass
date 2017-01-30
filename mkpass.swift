#! /usr/bin/swift
import Foundation
var member: [String] = []
member += GenerateMember().getMember(range: [[65,90]], exclude: [14,8])
member += GenerateMember().getMember(range: [[97,122]], exclude: [11])
member += GenerateMember().getMember(range: [[48,57]], exclude: [1,0])
member += GenerateMember().getMember(range: [[33,47],[58,64],[91,96],[123,126]], exclude: [29])
var passwd: String = ""
for n in 1...8 {
  var code: UInt32  = arc4random_uniform(UInt32(member.count))
  passwd += member[Int(code)]
}
print(passwd)
