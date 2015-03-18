/**
 * @author:     Pat Hawks
 * Created on:  Mar 06, 2015
 * Source File: Challenge2.js
 *
 * See this in action:
 *     http://student.pathawks.com/AICSC/Challenges/20150306/
 */
"use strict";

window.onload=function(){
    var formatNum = function( degrees, system ) {
        var FAHRENHEIT = "F";
        var CELSIUS = "C";
        var tempOut;

        switch( system ) {
            case FAHRENHEIT:
                tempOut = ((degrees - 32) * 5/9).toFixed(1) + "°" + CELSIUS;
                break;
            case CELSIUS:
                tempOut = (degrees * 9/5 + 32).toFixed(1) + "°" + FAHRENHEIT;
                break;
            default:
                return false;
        }
        return tempOut;
    };

    document.getElementsByTagName("form")[0].onsubmit=function(){
        var a=document.getElementById("tempin").value,
            b=document.getElementById("system").value,
            c=formatNum( a, b ),
            d=(+a).toFixed(1) + "°" + b + " == " + c; // (+a) to cast as double
        if ( !!a && !isNaN(+a) ) { // Not empty and can be cast as a double
            document.getElementById("outnum").innerHTML=d,
            document.body.className="displaying-output";
        } else {
            document.getElementById("tempin").value="";
            document.body.className="waiting-for-input";
        }
        return false;
    }
};
