# IDEA EDU Course ...

Implemented in the Track 'Introduction to Command Line and Unix Shell' of hyperskill.org's JetBrains Academy.

## Technology / External Libraries

- bash 3.2.57 on macOS
- bash testing suite BATS (bats-core, bats-assert, bats-support)

## Repository Contents

The sources of main project tasks (4 stages) and testing.

## Program description

The toy project implements a simple calculator with bash.
Stage 2: enter a simple operation with blanks separated, i.e. "2 + 45" or "-2 * -45" or "4 / 2".
Stage 3: also float values are parsed and allowed - result is taken using bc (basic calculator tool from bash)

Run tests using bats

Have fun!

## Project completion

[//]: # (Project was completed on xx.0d.22.)

## Progress

17.09.22 Project started - gitHub repo and project structure setup.

17.09.22 Stage 1 completed - parsing of calc operation line: posix regexp, functions in bash, switch the shell globbing on/off,
setup of BATS testing 

21.09.22 Stage 2 completed - parse the operation and print the result - or a failed check message from parsing. teststarter added.

21.09.22 Stage 3 completed - parse and allow float values now - test cases added
