#!/usr/bin/env bash

(( arg_count = $# ))
for (( i = 0; i < arg_count; i++));
do
    case "$1" in
        "G" | "g")
            echo "The defendant is guilty."
            ;;
        "N" | "n")
            echo "The defendant is not guilty."
            ;;
        "P" | "p")
            echo "The trial has been postponed."
            ;;
        *)
            echo "Order Order!"
            ;;
    esac
    shift
done
