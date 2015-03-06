#!/usr/bin/env ruby
#
# Author:      Pat Hawks
# Created on:  Feb 02, 2015
# Source File: Challenge1.rb
#
# To run:
#     ruby Challenge1.rb

MIN_NUM = 1000   # Ruby does not actually enforce constancy, but will produce a
MAX_NUM = 999999 # warning if these variables are later modified
PROMPT_STRING = """\
Enter a whole number between #{MIN_NUM} and #{MAX_NUM} without spaces or commas.
"""
FORMAT_STRING = "%d,%.3d\n"

begin
    puts PROMPT_STRING
    @inNum = gets.to_i
end while @inNum < MIN_NUM or @inNum > MAX_NUM

puts FORMAT_STRING%[ @inNum/1000, @inNum%1000 ]
