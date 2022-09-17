#!/usr/bin/env bash

solve() {
    angle_sum=$(($1 + $2 + $3))
    if [ $angle_sum -eq 180 ]
    then
        echo "Yes"
    else
        echo "No"
    fi    
}
solve $*
