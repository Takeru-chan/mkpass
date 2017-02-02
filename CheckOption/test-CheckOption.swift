#! /usr/bin/swift
import Foundation
struct ConditionDataSet {
  var condition: String
  var arguments: [String]
  var result: (upper: Bool, lower: Bool, number: Bool, symbol: Bool, exclude: Bool, length: Int, status: Int)
}
var returnSet: (upper: Bool, lower: Bool, number: Bool, symbol: Bool, exclude: Bool, length: Int, status: Int)
let testConditionDataSet: [ConditionDataSet] = [
  ConditionDataSet(condition:"No option", arguments:["command",""], result:(false, false, false, false, false, 0, 0)),
  ConditionDataSet(condition:"Specified correct length(10)", arguments:["command","10"], result:(false, false, false, false, false, 10, 0)),
  ConditionDataSet(condition:"Specified invalild length(-10)", arguments:["command","-10"], result:(false, false, false, false, false, 0, 1)),
  ConditionDataSet(condition:"Specified duplicated length(10 5)", arguments:["command","10","5"], result:(false, false, false, false, false, 5, 0)),
  ConditionDataSet(condition:"Specified correct switch(-a)", arguments:["command","-a"], result:(true, true, true, true, false, 0, 0)),
  ConditionDataSet(condition:"Specified correct switch(-ax)", arguments:["command","-ax"], result:(true, true, true, true, true, 0, 0)),
  ConditionDataSet(condition:"Specified correct switch(-a -x)", arguments:["command","-a","-x"], result:(true, true, true, true, true, 0, 0)),
  ConditionDataSet(condition:"Specified correct switch(-u)", arguments:["command","-u"], result:(true, false, false, false, false, 0, 0)),
  ConditionDataSet(condition:"Specified correct switch(-ux)", arguments:["command","-ux"], result:(true, false, false, false, true, 0, 0)),
  ConditionDataSet(condition:"Specified correct switch(-u -x)", arguments:["command","-u","-x"], result:(true, false, false, false, true, 0, 0)),
  ConditionDataSet(condition:"Specified correct switch(-l)", arguments:["command","-l"], result:(false, true, false, false, false, 0, 0)),
  ConditionDataSet(condition:"Specified correct switch(-lx)", arguments:["command","-lx"], result:(false, true, false, false, true, 0, 0)),
  ConditionDataSet(condition:"Specified correct switch(-l -x)", arguments:["command","-l","-x"], result:(false, true, false, false, true, 0, 0)),
  ConditionDataSet(condition:"Specified correct switch(-n)", arguments:["command","-n"], result:(false, false, true, false, false, 0, 0)),
  ConditionDataSet(condition:"Specified correct switch(-nx)", arguments:["command","-nx"], result:(false, false, true, false, true, 0, 0)),
  ConditionDataSet(condition:"Specified correct switch(-n -x)", arguments:["command","-n","-x"], result:(false, false, true, false, true, 0, 0)),
  ConditionDataSet(condition:"Specified correct switch(-s)", arguments:["command","-s"], result:(false, false, false, true, false, 0, 0)),
  ConditionDataSet(condition:"Specified correct switch(-sx)", arguments:["command","-sx"], result:(false, false, false, true, true, 0, 0)),
  ConditionDataSet(condition:"Specified correct switch(-s -x)", arguments:["command","-s","-x"], result:(false, false, false, true, true, 0, 0)),
  ConditionDataSet(condition:"Specified invalild switch(-A)", arguments:["command","-A"], result:(false, false, false, false, false, 0, 1)),
  ConditionDataSet(condition:"Specified correct switch(-a) and length(10)", arguments:["command","-a","10"], result:(true, true, true, true, false, 10, 0))]
for loop in testConditionDataSet {
  print(loop.condition, terminator:"")
  returnSet = CheckOption(arguments:loop.arguments).getOption()
  if returnSet.upper != loop.result.upper {
    print("\u{001B}[0;37;41m => NG\u{001B}[0;30m")
    print(returnSet)
  } else if returnSet.lower != loop.result.lower {
    print("\u{001B}[0;37;41m => NG\u{001B}[0;30m")
    print(returnSet)
  } else if returnSet.number != loop.result.number {
    print("\u{001B}[0;37;41m => NG\u{001B}[0;30m")
    print(returnSet)
  } else if returnSet.symbol != loop.result.symbol {
    print("\u{001B}[0;37;41m => NG\u{001B}[0;30m")
    print(returnSet)
  } else if returnSet.exclude != loop.result.exclude {
    print("\u{001B}[0;37;41m => NG\u{001B}[0;30m")
    print(returnSet)
  } else if returnSet.length != loop.result.length {
    print("\u{001B}[0;37;41m => NG\u{001B}[0;30m")
    print(returnSet)
  } else if returnSet.status != loop.result.status {
    print("\u{001B}[0;37;41m => NG\u{001B}[0;30m")
    print(returnSet)
  } else {
    print("\u{001B}[0;32m => OK\u{001B}[0;30m")
  }
}
