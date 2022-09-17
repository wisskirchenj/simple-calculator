#!/usr/bin/env bash
# Checking the password entered by user

echo "Enter password: "
read input
if [ $input = "Pass!" ]; then
    echo "Correct password entered"
fi

# same with test:
echo "Enter password: "
read input
if test $input = "Pass!" 
then
    echo "Correct password entered"
fi
