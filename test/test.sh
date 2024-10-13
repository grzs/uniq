#!/bin/bash
set -eu

TEST_DIR=$(dirname $0)
BIN_DIR=$(dirname $TEST_DIR)
INPUTS_DIR="${TEST_DIR}/inputs"
ERROR_LOGFILE="${TEST_DIR}/error.log"

run_cmd() {
    local output="$(cat "${INPUTS_DIR}/${INPUT_FILE}" | "${BIN_DIR}/${CMD}")"
    printf '  %-15s ' "$CMD"
    test "${REFERENCE_OUTPUT}" = "${output}" && echo "OK" || (echo "FAILED" && exit 5)
    return $?
}

run_case() {
    echo "${INPUT_FILE}:"
    REFERENCE_OUTPUT="$(cat "${INPUTS_DIR}/${INPUT_FILE}" | uniq)"

    for CMD in $(ls uniq.*)
    do run_cmd || printf '%-12s - %s\n' "$INPUT_FILE" "$CMD" >> "${ERROR_LOGFILE}"
    done
    echo
}

# START
cd $BIN_DIR
printf "" > "${ERROR_LOGFILE}"
echo -e "Testing implementations for files in ${INPUTS_DIR}/\n"

# RUN TESTS
for INPUT_FILE in $(ls "${INPUTS_DIR}")
do run_case
done

# CHECK FOR ERRORS
if read -n 1 < "${ERROR_LOGFILE}"
then cat "${ERROR_LOGFILE}" && exit 1
fi
