#!/usr/bin/env bash
# calculator stage 4

function parse_input() {
  if [ $# -ne 3 ]; then
    set_error
  fi
  left_operand=$1
  operator=$2
  right_operand=$3
  check_number $left_operand
  check_operator $operator
  check_number $right_operand
}

function check_number() {
  format="^[+-]?[0-9]+(\.[0-9]+)?$"
  if [[ ! $1 =~ $format ]]; then
    set_error
  fi
}

function check_operator() {
  format="^[+^*/-]$"  # '-' must be first or last in the brackets !
  if [[ ! "$1" =~ $format ]]; then
    set_error
  fi
}

function tee_echo() {
  echo $1 | tee -a operation_history.txt
}

function set_error() {
  if $parse_error; then
    return
  fi
  tee_echo "Operation check failed!"
  parse_error=true;
}

tee_echo "Welcome to the basic calculator!"
set -f # avoid * globbing of the mult. operator
while true; do
  parse_error=false;
  tee_echo "Enter an arithmetic operation or type 'quit' to quit:"
  read operation
  echo $operation >> operation_history.txt
  if [[ $operation =~ "quit" ]]; then
    break;
  fi
  parse_input $operation
  if ! $parse_error; then
    tee_echo `echo "scale=2; $left_operand $operator $right_operand" | bc -l`
  fi
done
tee_echo 'Goodbye!'
