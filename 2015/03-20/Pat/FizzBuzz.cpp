/**
 * FizzBuzz with modulo operation
 *
 * @author      Pat Hawks
 * Created on:  Mar 19, 2015
 * Source File: FizzBuzz.c
 *
 * To compile:
 *    gcc FizzBuzz.cpp -o FizzBuzz
 */

#include <iostream>

int main( void ) {
    for (unsigned int i=1; i<=100; ++i) {
        bool fizz = (i%3 == 0); // same as !(i%3)
        bool buzz = !(i%5);     // same as (i%5 == 0)

        if (fizz || buzz) {
            std::cout << (fizz?"Fizz":"") << (buzz?"Buzz":"") << std::endl;
        } else {
            std::cout << i << std::endl;
        }
    }
}
