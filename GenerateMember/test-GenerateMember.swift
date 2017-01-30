#! /usr/bin/swift
import Foundation
let testCase: [(condition: String, range: [[Int]], exclude: [Int], result: [String])] =
	[("Alphabet upper case, full set.", [[65,90]], [], ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]),
	("Alphabet upper case, excluded.", [[65,90]], [14,8], ["A", "B", "C", "D", "E", "F", "G", "H", "J", "K", "L", "M", "N", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]),
	("Alphabet lower case, full set.", [[97,122]], [], ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]),
	("Alphabet lower case, excluded.", [[97,122]], [11], ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]),
	("Number, full set.", [[48,57]], [], ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]),
	("Number, excluded.", [[48,57]], [1,0], ["2", "3", "4", "5", "6", "7", "8", "9"]),
	("Symbol, full set.", [[33,47],[58,64],[91,96],[123,126]], [], ["!", "\"", "#", "$", "%", "&", "\'", "(", ")", "*", "+", ",", "-", ".", "/", ":", ";", "<", "=", ">", "?", "@", "[", "\\", "]", "^", "_", "`", "{", "|", "}", "~"]),
	("Symbol, excluded.", [[33,47],[58,64],[91,96],[123,126]], [29], ["!", "\"", "#", "$", "%", "&", "\'", "(", ")", "*", "+", ",", "-", ".", "/", ":", ";", "<", "=", ">", "?", "@", "[", "\\", "]", "^", "_", "`", "{", "}", "~"])]
for var i in testCase {
	var member: [String] = []
	print("\(i.condition) ", terminator:"")
	if i.result == GenerateMember().getMember(range: i.range, exclude: i.exclude) {
		print("\u{001B}[0;32m=> OK\u{001B}[0;30m")
	} else {
		print("\u{001B}[0;37m=> NG\u{001B}[0;30m")
	}
}
