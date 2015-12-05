#!/usr/bin/swift
/**
 * FizzBuzz with modulo operation
 *
 * @author      Pat Hawks
 * Created on:  Mar 19, 2015
 * Source File: FizzBuzz.swift
 *
 * To run:
 *     swift FizzBuzz.swift
 * Or to compile:
 *     swiftc -sdk $(xcrun --show-sdk-path --sdk macosx) FizzBuzz.swift
 */

var fizz : Bool
var buzz : Bool

for i in 1...100 {
    fizz = (i % 3 == 0)
    buzz = (i % 5 == 0)

    switch true {
    case fizz && buzz:
        print("FizzBuzz")     // Look ma, no breaks!
    case fizz:
        print("Fizz")
    case buzz:
        print("Buzz")
    default:
        print(i)
    }
}
