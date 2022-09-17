#!/usr/bin/env bash
echo "You provided $# facts about yourself!"
echo "Your name is $1"
echo "Your age is $2"
echo "The command is: $0"
echo "All parameters as one string: $*"
# echo "All parameters as tokens: $@"
echo

personal_data() {
    echo "You provided $# facts about yourself!"
    echo "Your name is $1"
    echo "Your age is $2"
}
personal_data Anna 28
