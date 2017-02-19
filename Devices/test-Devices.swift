#! /usr/bin/swift
import Foundation
let screen = Screen()
let pasteboard = Pasteboard()
let environment = EnvironmentVariable()
let message: String = "Test message"
let names: [String] = ["HOME", "home"]
print("\u{001B}[0;30;1mScreen Device class test:\u{001B}[0;30m")
print("If string below is '\(message)', it is OK.")
screen.write(message:message)
print("\u{001B}[0;30;1m\nPasteboard Device class test:\u{001B}[0;30m")
print("Original pasteboard contains '\(pasteboard.read())'.")
pasteboard.write(message:message)
print("And if pasteboard contains '\(pasteboard.read())'.")
print("\u{001B}[0;30;1m\nEnvironmentVariable Device class test:\u{001B}[0;30m")
for n in names {
  print("\(n) = \(environment.read(name:n))")
}
