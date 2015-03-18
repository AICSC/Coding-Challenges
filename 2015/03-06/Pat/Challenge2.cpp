/**
 * @author:     Pat Hawks
 * Created on:  Mar 06, 2015
 * Source File: Challenge2.c
 *
 * To compile:
 *    g++ Challenge2.cpp -Wall -std=c++11 -o Challenge2
 */

#include <cmath>
#include <iomanip>
#include <iostream>
#include <string>
#if __cplusplus < 201103L
#warning You must compile this program with -std=c++11
#endif
#ifndef EXIT_SUCCESS
#define EXIT_SUCCESS 0
#endif

class Temperature {
public:
    static const char CELSIUS = 'C';
    static const char FAHRENHEIT = 'F';
    static const char UNKNOWN = '?';
    Temperature convertTemp() const;
    bool isValid() const;
    friend std::ostream& operator<<( std::ostream&, const Temperature& );
    friend std::istream& operator>>( std::istream&, Temperature& );
    friend bool operator==( const Temperature&, const Temperature& );
private:
    double degrees;
    char system;
};

int main( void ) {
    const char *PROMPT = "Enter the temperature and scale (eg. 80.0F): ";
    const char *EQUALS = " == ";
    Temperature tempIn;
    Temperature tempOut;

    do {
        std::cout << PROMPT;
        std::cin >> tempIn;
    } while ( !tempIn.isValid() );

    tempOut = tempIn.convertTemp();
    std::cout << std::setprecision(1) << std::fixed
              << tempIn  << EQUALS << tempOut << std::endl;

    return EXIT_SUCCESS;
}

/**
 * Converts a character to uppercase
 * This happens at compile time, so there is no performance penalty!
 *
 * @param  ch character to convert
 * @return uppercase equivilant of ch
 */
constexpr char ucase( char ch ){
    return ch & 0xDF;
}

/**
 * Converts a character to lowercase
 *
 * @param  ch character to convert
 * @return lowercase equivilant of ch
 */
constexpr char lcase( char ch ){
    return ch | 0x20;
}

/**
 * Convert a temperature Fahrenheit <=> Celsius
 *
 * @return Converted temperature object
 */
Temperature Temperature::convertTemp( void ) const {
    Temperature tempOut;
    switch( system ) {
        case FAHRENHEIT:
            tempOut.degrees = (degrees - 32) * 5/9;
            tempOut.system = CELSIUS;
            break;
        case CELSIUS:
            tempOut.degrees = degrees * 9/5 + 32;
            tempOut.system = FAHRENHEIT;
            break;
        default:
            tempOut.degrees = NAN;
            tempOut.system = UNKNOWN;
    }
    return tempOut;
}

/**
 * @return true if object contains a valid Temperature, otherwise false
 */
bool Temperature::isValid( void ) const {
    return system == FAHRENHEIT || system == CELSIUS;
}

std::ostream& operator<<( std::ostream &out, const Temperature &temp ) {
    out << temp.degrees << "°" << temp.system;
    return out;
}

std::istream& operator>>( std::istream &in, Temperature &temp ) {
    const size_t NOT_FOUND = std::string::npos;
    std::string input;
    size_t *nextChar = nullptr;

    std::getline( in, input );
    try {
        temp.degrees = stod( input, nextChar );
    } catch(...) {
        goto TemperatureInputFail; // I know, I know
    }

    if (
         input.find_first_of(ucase(Temperature::FAHRENHEIT))!=NOT_FOUND
      || input.find_first_of(lcase(Temperature::FAHRENHEIT))!=NOT_FOUND
    ) {
        temp.system = Temperature::FAHRENHEIT;
    } else if (
         input.find_first_of(ucase(Temperature::CELSIUS))!=NOT_FOUND
      || input.find_first_of(lcase(Temperature::CELSIUS))!=NOT_FOUND
    ) {
        temp.system = Temperature::CELSIUS;
    } else {
        TemperatureInputFail:
        temp.degrees = NAN;
        temp.system = Temperature::UNKNOWN;
    }

    return in;
}

bool operator==( const Temperature &a, const Temperature &b ) {
    if ( a.system == b.system )
        return a.degrees == b.degrees;
    else
        return a == b.convertTemp();
}
