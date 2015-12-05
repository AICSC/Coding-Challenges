#!/usr/bin/swift
/*
 * To run:
 *     swift Challenge1.swift
 * Or to compile:
 *     swiftc -sdk $(xcrun --show-sdk-path --sdk macosx) Challenge1.swift
 */

import Foundation;
let formatter = NSNumberFormatter()
    formatter.usesGroupingSeparator = true
    formatter.groupingSeparator = ","
let stdin = NSFileHandle.fileHandleWithStandardInput()

let MIN_NUM = 1000
let MAX_NUM = 999999
let PROMPT_STRING = "Enter a whole number between \(MIN_NUM) and \(MAX_NUM) without spaces or commas."
var inNum : Int
var outString : String

func input() -> Int {
    let string = NSString( data: stdin.availableData, encoding:NSUTF8StringEncoding )
    return string?.integerValue ?? 0
}

repeat {
    print( PROMPT_STRING )
    inNum = input()
} while ( inNum < MIN_NUM || inNum > MAX_NUM )

outString = formatter.stringFromNumber( inNum )!
print( outString )

stdin.closeFile()
