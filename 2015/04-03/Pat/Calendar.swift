#!/usr/bin/swift
/**
 * Given a month and year, display a calendar.
 *
 * @author      Pat Hawks
 * Created on:  Apr 03, 2015
 * Source File: Calendar.swift
 *
 * To run:
 *     swift Calendar.swift
 * Or to compile:
 *     swiftc -sdk $(xcrun --show-sdk-path --sdk macosx) Calendar.swift
 */

import Foundation;

func main() {
    var year: Int
    var month: Int

    repeat {
        print( "Enter month and year: " )
        fflush(__stdoutp) // Flush stdout so prompt appears right away
        (month, year) = input()
    } while ( month < 1 || month > 12 || year < 1 || year > 3000 )

    displayCalendar( year, month )
}

func input() -> (Int, Int) {
    let inputs: [String]! = readLine()?.componentsSeparatedByString(" ")
    return (Int(inputs[0]) ?? 0, Int(inputs[1]) ?? 0)
}

func isLeapYear( year: Int ) -> Bool {
    return (year%4==0 && (year%100 != 0 || year%400 == 0));
}

func calculateFirstDayOfMonth( year: Int, _ month: Int ) -> Int {
    let leapYear = isLeapYear( year )
    let d = 1
    let y = year % 100
    let mValues = [0,3,3,6,1,4,6,2,5,0,3,5]
    let m: Int
    if (leapYear&&month<=2) {
        m = (month==1) ? 6 : 2
    } else {
        m = mValues[month-1]
    }
    let c = 6-(year/100 % 4 * 2)

    return ( d + m + y + y/4 + c ) % 7
}

func padding( i: Int ) -> String {
    return String(count: i, repeatedValue: " " as Character)
}

func displayCalendar( year: Int, _ month: Int ) {
    let firstDay = calculateFirstDayOfMonth( year, month )
    let DAYS_IN_MONTH = [1: 31, 2: (isLeapYear(year) ? 29 : 28), 3: 31, 4: 30, 5: 31, 6: 30, 7: 31, 8: 31, 9: 30, 10: 31, 11: 30, 12: 31]
    let MONTHS: [String!] = [ nil, "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" ]
    var label = "\(MONTHS[month]) \(year)"
        label = padding( ( 21 - label.characters.count ) / 2 ) + label

    print("\n" + label)
    print(" S  M  T  W  T  F  S")
    print(padding( 3 * firstDay ), terminator: ""); // Print padding before first day, to align

    for i in 1...DAYS_IN_MONTH[month]! {
        let DAY = String(format: "%2d ", i)
        print(DAY, terminator: "")
        if (firstDay + i) % 7 == 0 {
            print("") // Print a newline at end of week
        }
    }
    print("")
}

main()
