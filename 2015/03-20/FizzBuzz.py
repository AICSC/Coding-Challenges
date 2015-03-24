#-----------------------------------------------------------------------
# Program name: FizzBuzz.py
# Author:       Kozmik Moore
# Date:         23 March, 2015
# Purpose:      This program receives no input and counts from 1-100, replacing 
#               multiples of three with the word "Fizz," multiples of five with 
#               the word "Buzz," and multiples of three and five with the word 
#               "FizzBuzz."
#-----------------------------------------------------------------------
# GLOBAL VARIABLE DEFINITIONS
#

#-----------------------------------------------------------------------
# CONSTANT DEFINITIONS

#-----------------------------------------------------------------------
# FUNCTION DEFINITIONS
    # Function Variable Definitions            

#-----------------------------------------------------------------------
# PROGRAM'S MAIN LOGIC
for x in range(1, 101):
    if (x % 3 == 0 or x % 5 == 0):
        if (x % 3 == 0):
            print("Fizz", end= "")
        if (x % 5 == 0):
            print("Buzz", end= "")
    else:
        print(str(x), end= "")
    print("\n", end= "")
        
input("\nRun complete. Press the Enter key to exit.")
