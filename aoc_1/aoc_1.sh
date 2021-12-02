#!/bin/zsh

# Part 1 of AOC-1

input=aoc_1_in.txt

function offsetter (){
	# input:  aoc input filename
	# output: all but the first $2 lines of the input file
	# assumptions: at least 10 lines in the input file.

	tail -n $(( $(wc -l "$input" | egrep -o '\d\d+' ) - $1 )) "$input"
}

# Unfortunately the paste command later complains of long input if I try to redirect,
# so to move on I just saved the output into two files.

offsetter 1 > aoc_1-1.txt
offsetter 3 > aoc_1-2.txt

# Soution to part 1

while read line; do 

	echo $(( $line ))

done <<< "$(paste -d \- "$input" aoc_1-1.txt | egrep -o '\d+-\d+')" | egrep -o '-' | wc -l

# Solution to part 2

while read line; do

	echo $(( $line ))

done <<< "$(paste -d \- "$input" aoc_1-2.txt | egrep -o '\d+-\d+')" | egrep -o '-' | wc -l
