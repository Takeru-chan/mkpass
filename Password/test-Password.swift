#! /usr/bin/swift
import Foundation
var condition: (member:[Character], length:Int) = (["1","2","3","4","5"],50)
var result: String
var status: Int = 0
var check: Bool
result = Password().get(member:condition.member, length:condition.length)
print("Seeds:\(condition.member), Length:\(condition.length)")
print("Result:\(result)")
for i in result.characters {
  check = false
  for j in condition.member {
    if i == j { // Change while loop check!!
      check = true
    }
  }
  if check == false {
    status |= 1
  }
}
if status != 1 {
    print("\u{001B}[0;32mCharacters check is passed.\u{001B}[0;30m")
} else {
    print("\u{001B}[0;31mCharacters check is failed.\u{001B}[0;30m")
}
if result.characters.count != condition.length {
  status |= 2
  print("\u{001B}[0;31mLength check is failed.\u{001B}[0;30m")
} else {
  print("\u{001B}[0;32mLength check is passed.\u{001B}[0;30m")
}
