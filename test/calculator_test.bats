setup() {
    load 'test_helper/bats-support/load'
    load 'test_helper/bats-assert/load'
    SRC_DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )/../src"
    rm -f operation_history.txt
}

function do_calc() {
    echo -e $1"\nquit" | bash $SRC_DIR/calculator.bash
}

function history_written() {
    if [[ -e operation_history.txt ]]; then
        return 0
    fi
    return 1
}

# ---------- happy case testing -------
@test "history written" {
    refute history_written
    run do_calc ""
    assert history_written
}

@test "addition parsed" {
    run do_calc "55 + 65"
    assert_output --partial 120
}

@test "subtraction parsed" {
    set -f
    run do_calc "5 - -25"
    assert_output --partial 30
}

@test "multiplication parsed" {
    set -f
    run do_calc "12 * -3"
    assert_output --partial 36
}

@test "multiplication 2 parsed" {
    set -f
    run do_calc "0 * -45"
    assert_output --partial 0
}

@test "division parsed" {
    run do_calc "48 / 2"
    assert_output --partial '24'
}

@test "float division parsed" {
    run do_calc "22 / -7"
    assert_output --partial '-3.14'
}

@test "2nd float division parsed" {
    run do_calc "5.4 / 2.8"
    assert_output --partial '1.92'
}

@test "power function parsed" {
    run do_calc "2 ^ 5"
    assert_output --partial '32'
}

@test "normal output" {
    run do_calc
    assert_output --partial 'Welcome to the basic calculator!'
    assert_output --partial "Enter an arithmetic operation or type 'quit' to quit:"
    assert_output --partial 'Goodbye!'
}

# ---------- error case testing -------
@test "invalid float is rejected" {
    run do_calc "33..2 / -12"
    assert_output --partial 'Operation check failed!'
}

@test "float with ',' is rejected" {
    run do_calc "33,2 / -12"
    assert_output --partial 'Operation check failed!'
}

@test "only 2 args rejected" {
    run do_calc "33 +"
    assert_output --partial 'Operation check failed!'
}

@test "4 args rejected" {
    run do_calc "33 + 12 -"
    assert_output --partial 'Operation check failed!'
}

@test "illegal number rejected" {
    run do_calc "33a + 12"
    assert_output --partial 'Operation check failed!'
}

@test "double ++ rejected" {
    run do_calc "33 ++ 12"
    assert_output --partial 'Operation check failed!'
}

@test "double ** rejected" {
    run do_calc "33 ** 12"
    assert_output --partial 'Operation check failed!'
}

@test "double -- rejected" {
    run do_calc "33 -- 12"
    assert_output --partial 'Operation check failed!'
}