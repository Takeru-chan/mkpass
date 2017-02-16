#! /usr/bin/swift
import Foundation
let testCase: [(condition: String, arguments: [String], result: String)] =
  [("No option -> ", ["./test-Condition"], "abcdefghijklmnopqrstuvwxyz0123456789-8-0"),
  ("Specified correct length(10) -> ", ["./test-Condition", "10"], "abcdefghijklmnopqrstuvwxyz0123456789-10-0"),
  ("Specified invalild length(-10) -> ", ["./test-Condition", "-10"], "-0-1"),
  ("Specified invalild length(0.5) -> ", ["./test-Condition", "0.5"], "-0-1"),
  ("Specified duplicated length(10 5) -> ", ["./test-Condition", "10", "5"], "abcdefghijklmnopqrstuvwxyz0123456789-5-0"),
  ("Specified correct switch(-a) -> ", ["./test-Condition", "-a"], "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~-8-0"),
  ("Specified correct switch(-ax) -> ", ["./test-Condition", "-ax"], "ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz23456789!\"#$%&'()*+,-./:;<=>?@[\\]^_`{}~-8-0"),
  ("Specified correct switch(-a -x) -> ", ["./test-Condition", "-a", "-x"], "ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz23456789!\"#$%&'()*+,-./:;<=>?@[\\]^_`{}~-8-0"),
  ("Specified correct switch(-u) -> ", ["./test-Condition", "-u"], "ABCDEFGHIJKLMNOPQRSTUVWXYZ-8-0"),
  ("Specified correct switch(-ux) -> ", ["./test-Condition", "-ux"], "ABCDEFGHJKLMNPQRSTUVWXYZ-8-0"),
  ("Specified correct switch(-u -x) -> ", ["./test-Condition", "-u", "-x"], "ABCDEFGHJKLMNPQRSTUVWXYZ-8-0"),
  ("Specified correct switch(-l) -> ", ["./test-Condition", "-l"], "abcdefghijklmnopqrstuvwxyz-8-0"),
  ("Specified correct switch(-lx) -> ", ["./test-Condition", "-lx"], "abcdefghijkmnopqrstuvwxyz-8-0"),
  ("Specified correct switch(-l -x) -> ", ["./test-Condition", "-l", "-x"], "abcdefghijkmnopqrstuvwxyz-8-0"),
  ("Specified correct switch(-n) -> ", ["./test-Condition", "-n"], "0123456789-8-0"),
  ("Specified correct switch(-nx) -> ", ["./test-Condition", "-nx"], "23456789-8-0"),
  ("Specified correct switch(-n -x) -> ", ["./test-Condition", "-n", "-x"], "23456789-8-0"),
  ("Specified correct switch(-s) -> ", ["./test-Condition", "-s"], "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~-8-0"),
  ("Specified correct switch(-sx) -> ", ["./test-Condition", "-sx"], "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{}~-8-0"),
  ("Specified correct switch(-s -x) -> ", ["./test-Condition", "-s", "-x"], "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{}~-8-0"),
  ("Specified correct switch(-x) -> ", ["./test-Condition", "-x"], "abcdefghijkmnopqrstuvwxyz23456789-8-0"),
  ("Specified invalild switch(-A) -> ", ["./test-Condition", "-A"], "-0-1"),
  ("Specified correct switch(-a) and length(10) -> ", ["./test-Condition", "-a", "10"], "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~-10-0")]
var condition: (member:[Character], length:Int, status:Int32)
var result: String
var strings: String
for var i in 0..<testCase.count {
  strings = ""
  print(testCase[i].condition, terminator:"")
  condition = Condition(arguments:testCase[i].arguments).get()
  for n in condition.member {
    strings += "\(n)"
  }
  result = "\(strings)-\(condition.length)-\(condition.status)"
  if result == testCase[i].result {
    print("\u{001B}[0;32mOK\u{001B}[0;30m")
  } else {
    print("\u{001B}[0;31mNG\nCorrect\t\(testCase[i].result)\nResult\t\(result)\u{001B}[0;30m")
  }
}
