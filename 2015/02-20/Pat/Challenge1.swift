#!/usr/bin/swift
/*
 * To run:
 *     swift Challenge1.swift
 * Or to compile:
 *     swiftc -sdk $(xcrun --show-sdk-path --sdk macosx) Challenge1.swift
 */

import Foundation;

let MIN_NUM = 1000
let MAX_NUM = 999_999
let PROMPT_STRING = "Enter a whole number between \(MIN_NUM) and \(MAX_NUM) without spaces or commas."
var inNum : Int

func input() -> Int {
    return Int(readLine()!) ?? 0
}

extension Int {
    var commaSeperated: String! {
        let formatter = NSNumberFormatter()
            formatter.usesGroupingSeparator = true
            formatter.groupingSeparator = ","
        return formatter.stringFromNumber( self )
    }
}

repeat {
    print( PROMPT_STRING )
    inNum = input()
} while ( inNum < MIN_NUM || inNum > MAX_NUM )

print( inNum.commaSeperated )
