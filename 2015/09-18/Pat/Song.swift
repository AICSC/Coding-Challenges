#!/usr/bin/swift
/**
 * @author      Pat Hawks
 * Created on:  Dec 06, 2015
 * Source File: Song.swift
 *
 * To run:
 *     swift Song.swift
 * Or to compile:
 *     swiftc -sdk $(xcrun --show-sdk-path --sdk macosx) Song.swift
 */

var bottles = 99
repeat {
    print("\(bottles) bottles of beer on the wall")
    print("\(bottles) bottles of beer")
    print("Take one down, Pass it around")
    bottles -= 1
    print("\(bottles) \(bottles > 1 ? "" : "last ")bottle\(bottles > 1 ? "s" : "") of beer on the wall\n")
} while bottles > 1

print("One last bottle of beer on the wall\nOne last bottle of beer\nTake it down, Pass it around\nNo more bottles of beer on the wall\n")
