#!/bin/bash
# FizzBuzz 
# This is a program that counts from 1-100, replacing multiples of three with
# the word "Fizz," multiples of five with the word "Buzz," and multiples of 
# three and five with the word "FizzBuzz."


for integer in {1..100}
do
	if (($integer % 3 == 0)) || (($integer % 5 == 0));then
		if (($integer % 3 == 0));then
			printf "Fizz"
		fi
		if (($integer % 5 == 0));then
			printf "Buzz"
		fi
	else
		printf "%s" $integer
	fi
	printf "\n"
done
