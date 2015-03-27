/**
 * FizzBuzz with no modulo operation
 *
 * @author      Pat Hawks
 * Created on:  Mar 19, 2015
 * Source File: FizzBuzz.c
 *
 * To compile:
 *    gcc FizzBuzz.c -o FizzBuzz
 */

#include <stdio.h>

int main( void ) {
    const char* FIZZ = "Fizz";
    const char* BUZZ = "Buzz";

    for (unsigned int i=1, j=1; i<101; ++i, ++j) {
        switch (j) {
            case 15:
                printf("%s%s\n", FIZZ, BUZZ);
                j=1, ++i;
                break;
            case  9:
                printf("%s\n%s\n", FIZZ, BUZZ);
                ++i, ++j;
                continue;
            case  5:
                printf("%s\n", BUZZ);
                ++i, ++j;
            case  3:
            case 12:
                printf("%s\n", FIZZ);
                ++i, ++j;
        }
        printf("%d\n", i);
    }
}
