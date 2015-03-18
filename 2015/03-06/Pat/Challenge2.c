/**
 * @author:     Pat Hawks
 * Created on:  Mar 06, 2015
 * Source File: Challenge2.c
 *
 * To compile:
 *    gcc Challenge2.c -Wall -o Challenge2
 */

#include <stdio.h>
#include <math.h>
#ifndef EXIT_SUCCESS
#define EXIT_SUCCESS 0
#endif

#define CELSIUS 'C'
#define FAHRENHEIT 'F'
#define UNKNOWN '?'

typedef struct Temperature {
    double degrees;
    char system;
} Temperature;

/**
 * Convert a temperature Fahrenheit <=> Celsius
 *
 * @param tempIn        Input temperature
 * @param tempOut       Placeholder for Output temperature
 */
void convertTemp( Temperature *tempIn, Temperature *tempOut ) {
    switch( tempIn->system ) {
        case FAHRENHEIT:
            tempOut->degrees = (tempIn->degrees - 32) * 5/9;
            tempOut->system = CELSIUS;
            return;
        case CELSIUS:
            tempOut->degrees = tempIn->degrees * 9/5 + 32;
            tempOut->system = FAHRENHEIT;
            return;
        default:
            tempOut->degrees = NAN;
            tempOut->system = UNKNOWN;
            return;
    }
}

int main( void ) {
    const char *PROMPT_STRING = "Enter the temperature and scale (eg. 80.0F): ";
    const char *SCAN_FORMAT = "%lf %1[CcFf]*%s";
    const char *OUTPUT_FORMAT = "%.1lf°%1c == %.1lf°%1c\n";
    Temperature tempIn;
    Temperature tempOut;

    int scannedArgs;
    do {
        printf( "%s", PROMPT_STRING );
        scannedArgs = scanf( SCAN_FORMAT, &(tempIn.degrees), &(tempIn.system) );
        while ( getchar() != '\n' ) {} // Flush input buffer
        tempIn.system &= 0xDF;         // Char to Uppercase
    } while ( scannedArgs != 2 );

    convertTemp( &tempIn, &tempOut );
    printf(
        OUTPUT_FORMAT,
        tempIn.degrees,  tempIn.system,
        tempOut.degrees, tempOut.system
    );

    return EXIT_SUCCESS;
}
