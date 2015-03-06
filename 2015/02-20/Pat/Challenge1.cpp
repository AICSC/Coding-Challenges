/**
 * @author:     Pat Hawks
 * Created on:  Feb 02, 2015
 * Source File: Challenge1.cpp
 *
 * To compile:
 *    g++ Challenge1.cpp -Wall -o Challenge1
 */

#include <iomanip>
#include <iostream>
#include <locale>
#include <string>
using namespace std;

struct formatNumber : numpunct<char> {
    string do_grouping() const {return "\03";}
};

int main( void ) {
    const string PROMPT_STRING =
        "Enter a whole number between 1000 and 999999 without spaces or commas.";
    int inNum;
    do {
        cout << PROMPT_STRING << endl;
        cin >> inNum;
    } while ( inNum < 1000 || inNum > 999999 );

    locale loc( cout.getloc(), new formatNumber );
    cout.imbue( loc );
    cout << inNum << endl;

    return 0;
}
