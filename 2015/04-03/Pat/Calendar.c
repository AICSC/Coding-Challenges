/**
 * Given a month and year, display a calendar.
 *
 * @author      Pat Hawks
 * Created on:  Apr 12, 2015
 * Source File: Calendar.c
 *
 * To compile:
 *     gcc -Wall -Wextra Calendar.c -o Calendar
 */

#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void displayCalendar(int,int);

int main( void ) {
    int year;
    int month;

    do {
        printf( "Enter month and year: " );
        scanf( "%d %d", &month, &year );
    } while ( month < 1 || month > 12 || year < 1 || year > 3000 );

    displayCalendar( year, month );
}

bool isLeapYear( int year ) {
    return (year%4==0 && (year%100 != 0 || year%400 == 0));
}

int calculateFirstDayOfMonth( int year, int month ) {
    int d = 1;
    int y = year % 100;
    int mValues[] = {0,3,3,6,1,4,6,2,5,0,3,5};
    int m;
    if (isLeapYear( year ) && month<=2) {
        m = (month==1) ? 6 : 2;
    } else {
        m = mValues[month-1];
    }
    int c = 6-(year/100 % 4 * 2);

    return ( d + m + y + y/4 + c ) % 7;
}

void displayCalendar( int year, int month ) {
    static char* PADDING = "                  ";
    static char* MONTHS[] = { "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" };
    int firstDay = calculateFirstDayOfMonth( year, month );
    int DAYS_IN_MONTH[] = { 31, (isLeapYear(year) ? 29 : 28), 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

    printf("%s%s %4d\n", PADDING+(18-(16-(strlen(MONTHS[month-1])))/2), MONTHS[month], year);
    printf(" S  M  T  W  T  F  S\n");
    printf("%s", PADDING+(18- 3*firstDay )); // Print padding before first day, to align

    for (int i=1; i<=DAYS_IN_MONTH[month-1]; ++i) {
        printf("%2d ", i);
        ++firstDay;
        firstDay %= 7;
        if (firstDay==0) {
            printf("\n"); // Print a newline at end of week
        }
    }
    printf("\n");
}
