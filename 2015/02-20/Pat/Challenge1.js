/**
 * @author:     Pat Hawks
 * Created on:  Feb 02, 2015
 * Source File: Challenge1.js
 *
 * See this in action:
 *     http://student.pathawks.com/AICSC/Challenges/20150202/
 */

"use strict";

// Throughout this script, I use the idom x|0 to dynamically cast x to an int

var formatNum = function( inNum ) {
    if ( inNum >= 1000 && inNum <= 999999 ) {
        var lastThree = inNum%1000;
        return ((inNum/1000)|0)+","+(lastThree<100?(lastThree<10?"00":"0"):"")+lastThree;
    }
    return false;
};
