/**
 * @author:     Pat Hawks
 * Created on:  Feb 02, 2015
 * Source File: Challenge1.c
 *
 * To compile:
 *    gcc Challenge1.c -Wall -o Challenge1
 */

#include <limits.h>
#include <stdio.h>

const long MIN_NUM = 1000, MAX_NUM = ULONG_MAX;
const int BUFFER_SIZE = 27; // log10(ULONG_MAX)+log10(ULONG_MAX)/3+1
const char *PROMPT_STRING = "Enter a whole number between %lu and %lu\nwithout spaces or commas.\n";
const char *SCAN_FORMAT = "%lu";
const char *OUTPUT_FORMAT = "%s\n";
const char ASCII_ZERO = '0';

void formatNumber( unsigned long inNum, char *numString ) {
    unsigned long digits;
    int commaPosition, position;

    position = 0;
    digits = inNum;
    while ( digits ) {
        ++position;
        digits /= 10;
    }
    position += (position-1) / 3; // How many commas we will need
    numString[position] = 0;   // null terminator
    commaPosition = position - 4; // three digits + null terminator
    while ( position-- ) {
        if ( position == commaPosition && position > 0 ) {
            numString[position--] = ',';
            commaPosition -= 4;   // three digits + position of current comma
        }
        numString[position] = inNum % 10 + ASCII_ZERO;
        inNum /= 10;
    }

    return;
}

int main( void ) {
    unsigned long inNum;
    char numString[BUFFER_SIZE];

    do {
        printf( PROMPT_STRING, MIN_NUM, MAX_NUM );
        scanf( SCAN_FORMAT, &inNum );
        while ( getchar() != '\n' ) {} // Flush input buffer
    } while ( inNum < MIN_NUM );
//  printf( "%lu,%.3lu\n", inNum/1000, inNum%1000 );
    formatNumber( inNum, numString );
    printf( OUTPUT_FORMAT, numString );

    return 0;
}
