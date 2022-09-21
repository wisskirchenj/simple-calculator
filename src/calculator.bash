#!/usr/bin/env bash
# calculator stage 1

function parse_input() {
  if [ $# -ne 3 ]; then
    error_exit
  fi
  left_operand=$1
  operator=$2
  right_operand=$3
  check_number $left_operand
  check_operator $operator
  check_number $right_operand
}

function check_number() {
  format="^[+-]?[0-9]+$"
  if [[ ! $1 =~ $format ]]; then
    error_exit
  fi
}

function check_operator() {
  format="^[+*/-]$"  # '-' must be first or last in the brackets !
  if [[ ! "$1" =~ $format ]]; then
    error_exit
  fi
}

function error_exit() {
  echo "Operation check failed!"
  exit
}

echo "Enter an arithmetic operation:"
read operation
set -f # avoid * globbing of the mult. operator
parse_input $operation
echo `expr $left_operand $operator $right_operand`