#!/usr/bin/env bash
#   e.g. call as: > bash skipper.bash 1 1 1 1 2 no 2 no 3 no no 1 0


function skipper() {
    while true
    do
        case "$1" in
            0)
                exit;;
            1)
                echo "1"
                shift;;
            2)
                echo "2"
                shift 2;;
            3)
                echo "3"
                shift 3;;
        esac
    done
}
skipper $*
