/*
 * Tester program
 * @author:     Diego Diaz
 * Created on:  Aug 23, 2015
 * Source File: 
 */

#include <iostream>
#include <sstream>
#include <string>
using namespace std;

int main(int argc, char *argv[]) {
    //int numb[30];
    string bingo = "BINGO";
    string letter;
    int loc = 0;
    int numb;

    srand (time(NULL));

    for(int row = 0; row < 6; row++){
        for(int col = 0; col < 5; col++){
            while(row == 0 && loc < 5){
                letter = bingo.substr(loc,1);
                cout << "[" << letter << " " << "]";
                loc++;
             }
             numb = rand() % 100;
             if(row != 0){
                if(numb < 10){
                   cout << "[" << "0" << numb << "]";
                }
                else if( row == 3 && col == 2){
                   cout << "[" << "**" << "]";
                }
                else{
                   cout << "[" << numb << "]";
                }
            }
        }
        cout<< endl;
    }
}
