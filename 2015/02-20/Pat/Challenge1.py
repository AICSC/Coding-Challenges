#!/usr/bin/env python
#
# Author:      Pat Hawks
# Created on:  Feb 02, 2015
# Source File: Challenge1.py
#
# To run:
#     python Challenge1.py

MIN_NUM = 1000   # Python does not actually enforce constancy, but hopefully the
MAX_NUM = 999999 # SCREAMING_SNAKE_CASE is a hint to develoopers not to modify
                 # these variables
PROMPT_STRING = '''\
Enter a whole number between {min} and {max} without spaces or commas.
'''.format( min=MIN_NUM, max=MAX_NUM )
FORMAT_STRING = "{:,}"
inNum = None

while True: # What I'm really after is a `do while` loop
    try:
        inNum = int( input( PROMPT_STRING ) )
        if inNum >= MIN_NUM and inNum <= MAX_NUM:
            break
    except: # If the input cannot be converted to an int:
        pass

print( FORMAT_STRING.format( inNum ) )
