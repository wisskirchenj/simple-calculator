setup() {
    load 'test_helper/bats-support/load'
    load 'test_helper/bats-assert/load'
    SRC_DIR="$( cd "$( dirname "$BATS_TEST_FILENAME" )" >/dev/null 2>&1 && pwd )/../src"
}

function do_calc() {
    echo $1 | bash $SRC_DIR/calculator.bash
}

# ---------- happy case testing -------
@test "addition parsed" {
    run do_calc "33 + 45"
    assert_output --partial 'Operation check passed!'
}

@test "subtraction parsed" {
    run do_calc "-33 - 45"
    assert_output --partial 'Operation check passed!'
}

@test "multiplication parsed" {
    set -f
    run do_calc "0 * -45"
    assert_output --partial 'Operation check passed!'
}

@test "division parsed" {
    run do_calc "+33 / -1245"
    assert_output --partial 'Operation check passed!'
}

# ---------- error case testing -------
@test "float is rejected" {
    run do_calc "33.2 / -12"
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