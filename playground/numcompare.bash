#!/usr/bin/env bash
num1=$1
num2=$2

if [ $num1 -eq $num2 ]
then
    echo "Numbers are equal"
elif [ $num1 -gt $num2 ]
then
    echo "First number is greater"
else
    echo "Second number is greater"
fi
