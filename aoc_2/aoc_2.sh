#!/bin/zsh

# Part 1 of AOC-1

dep=0; pos=0

while read line; do

	x="$(echo "$line" | egrep -o '\d+')"

	if [[ "$(echo $line | egrep -o 'forward' )" ]]; then
		pos=$(( $pos + $x ))
	
	elif [[ "$(echo $line | egrep -o 'up' )" ]]; then
		dep=$(( $dep - $x ))
	
	elif [[ "$(echo $line | egrep -o 'down' )" ]]; then
		dep=$(( $dep + $x ))
	
	fi

done < aoc_2_in.txt

echo "$(( $pos * $dep ))"


# Part 2 of AOC-2

aim=0; dep=0; pos=0

while read line; do

	x="$(echo "$line" | egrep -o '\d+')"

	if [[ "$(echo $line | egrep -o 'forward' )" ]]; then
		pos=$(( $pos + $x ))
		dep=$(( $dep + $aim * $x ))
	
	elif [[ "$(echo $line | egrep -o 'up' )" ]]; then
		aim=$(( $aim - $x ))
	
	elif [[ "$(echo $line | egrep -o 'down' )" ]]; then
		aim=$(( $aim + $x ))
	
	fi

done < aoc_2_in.txt

echo "$(( $pos * $dep ))"
