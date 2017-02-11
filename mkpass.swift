#! /usr/bin/swift
import Foundation
let screen:Screen = Screen()
let pasteboard:Pasteboard = Pasteboard()
var returnSet: (upper:Bool, lower:Bool, number:Bool, symbol:Bool, exclude:Bool, length:Int, status:Int32) = Condition().get()
var member: [String] = []
if returnSet.status == 0 {
  if returnSet.upper {
    if returnSet.exclude {
      member += GenerateMember().getMember(range: [[65,90]], exclude: [14,8])
    } else {
      member += GenerateMember().getMember(range: [[65,90]], exclude: [])
    }
  }
  if returnSet.lower {
    if returnSet.exclude {
      member += GenerateMember().getMember(range: [[97,122]], exclude: [11])
    } else {
      member += GenerateMember().getMember(range: [[97,122]], exclude: [])
    }
  }
  if returnSet.number {
    if returnSet.exclude {
      member += GenerateMember().getMember(range: [[48,57]], exclude: [1,0])
    } else {
      member += GenerateMember().getMember(range: [[48,57]], exclude: [])
    }
  }
  if returnSet.symbol {
    if returnSet.exclude {
      member += GenerateMember().getMember(range: [[33,47],[58,64],[91,96],[123,126]], exclude: [29])
    } else {
      member += GenerateMember().getMember(range: [[33,47],[58,64],[91,96],[123,126]], exclude: [])
    }
  }
  var passwd: String = ""
  for n in 1...returnSet.length {
    var code: UInt32  = arc4random_uniform(UInt32(member.count))
    passwd += member[Int(code)]
  }
  screen.write(message:passwd)
  pasteboard.write(message:passwd)
} else {
  screen.write(message:"option error!")
}
exit(returnSet.status)