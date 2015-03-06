/**
 * @author:     Pat Hawks
 * Created on:  Feb 02, 2015
 * Source File: Challenge1HardMode.java
 *
 * To compile:
 *    javac -Xlint:all Challenge1HardMode.java
 */

import java.util.Scanner;

public class Challenge1HardMode {
    static final long MIN_NUM = 1000, MAX_NUM = Long.MAX_VALUE;
    static final String PROMPT_STRING = "Enter a whole number between %d"
                                      + " and %d\nwithout spaces or commas.\n";

    public static String formatNumber( long inNum ) {
        String numString = "";
        int commaPosition = 4;

        while ( inNum != 0 ) {
            if ( --commaPosition == 0 ) {
                numString = ',' + numString;
                commaPosition = 3;
            }
            numString = (char) (inNum % 10 + '0') + numString;
            inNum /= 10;
        }

        return numString;
    }

    public static void main( String[] args ) {
        Scanner in = new Scanner( System.in );
        long inNum;

        do {
            System.out.printf( PROMPT_STRING, MIN_NUM, MAX_NUM );
            inNum = in.nextLong();
        } while ( inNum < MIN_NUM || inNum > MAX_NUM );
        System.out.println( formatNumber( inNum ) );

        in.close();
        return;
    }
}
