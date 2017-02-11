#! /usr/bin/swift
import Foundation
let screen = Screen()
let pasteboard = Pasteboard()
let message = "Test message"
print("If string below is '\(message)', it is OK.")
screen.write(message:message)
print("Original pasteboard contains '\(pasteboard.read())'.")
pasteboard.write(message:message)
print("And if pasteboard contains '\(pasteboard.read())'.")
