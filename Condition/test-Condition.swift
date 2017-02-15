#! /usr/bin/swift
import Foundation
var result:(member:[Character], length:Int, status:Int32)
var strings: String = ""
result = Condition(arguments:CommandLine.arguments).get()
for n in result.member {
	strings += "\(n)"
}
print("\(strings)-\(result.length)-\(result.status)")
