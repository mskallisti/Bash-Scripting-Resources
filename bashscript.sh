#!/bin/bash

echo "This prints to console"

# This is a comment

variable="setting a variable works like this"

echo $variable # prints that set variable

# -- IF Conditional --
# "if" starts conditional, then wrap in brackets

if [$index -lt 5] # if variable "index" is less than 5
then
	echo $index #index conditional blocks
else
	echo 5
fi # ends if loop

# Equal: -eq
# Not equal: -ne
# Less than or equal: -le
# Less than: -lt
# Greater than or equal: -ge
# Greater than: -gt
# Is null: -z
# Equal: ==
# Not equal: !=

# -- LOOP Conditional --

for word in $paragraph
do
	echo $word
done

# Within bash scripting until and while are very similar. 
# While loops keep looping while the provided condition is true whereas until loops loop until the condition is true.

first_greeting="Nice to meet you!"
later_greeting="How are you?"
greeting_occasion=0
while [ $greeting_occasion -lt 3 ]
do
  if [ $greeting_occasion -lt 1 ] # indent for code block
  then
    echo $first_greeting # indent for nested code block
  else
    echo $later_greeting
  fi
  # Use (()) to wrap arithmetic operations
  greeting_occasion=$((greeting_occasion + 1)) # increment variable by 1
done

# -- INPUTS --

echo "Guess a number"
read number # <-- set user input to variable "number"
echo "You guessed $number"

for color in "$@" # <--- instead of input $1, $2, $3, etc, iterate for each space-separated value
do
	echo $color
done

files=/some/directory/* # <-- all files in /some/directory/ are accessed through variable $files

# -- ALIASES --
# add aliases to ~/.bashrc to skip "./" format
alias saycolors='./saycolors.sh'




