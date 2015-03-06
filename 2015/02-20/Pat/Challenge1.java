/**
 * @author:     Pat Hawks
 * Created on:  Feb 02, 2015
 * Source File: Challenge1.java
 *
 * To compile:
 *    javac -Xlint:all Challenge1.java
 */

import java.util.Scanner;

public class Challenge1 {
    public static void main( String[] args ) {
        final String PROMPT_STRING = "Enter a whole number between %d and %d "
                                   + "without spaces or commas.\n";
        final String FORMAT_STRING = "%,d\n";
        final int MIN_NUM = 1000, MAX_NUM = 999999;
        Scanner in = new Scanner( System.in );
        int inNum;

        do {
            System.out.printf( PROMPT_STRING, MIN_NUM, MAX_NUM );
            inNum = in.nextInt();
        } while ( inNum < MIN_NUM || inNum > MAX_NUM );

//      The Right Way
        System.out.printf( FORMAT_STRING, inNum );

//      System.out.printf( "%d,%3d\n", inNum/1000, inNum%1000 );

/*      System.out.print( inNum/1000 );
 *      System.out.print( "," );
 *      if( inNum%1000 < 100 ) // Print some leading zeros?
 *          System.out.print( inNum%1000<10 ? "00" : "0" );
 *      System.out.println( inNum%1000 );
 */
        in.close();
        return;
    }
}
