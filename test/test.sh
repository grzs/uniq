#!/bin/bash
set -eu

TEST_DIR=$(dirname $0)
BIN_DIR=$(dirname $TEST_DIR)
PATH=$(realpath $BIN_DIR):$PATH
INPUTS_DIR="${TEST_DIR}/inputs"
ERROR_LOGFILE="${TEST_DIR}/error.log"

RESULT_FMT='  %6s  %-15s %s\n'  # duration, cmd, SUCCESS/FAILURE

run_cmd() {
    local begin=$(date +%s.%N)
    local output="$(cat "${INPUTS_DIR}/${INPUT_FILE}" | "${CMD}")"
    local rc=$?
    local end=$(date +%s.%N)
    local duration=$(LC_NUMERIC="C.UTF-8" printf "%.4f" "$(echo $end - $begin | bc)")

    test "${CMD}" = "uniq" && REFERENCE_OUTPUT="${output}"

    if [[ $rc -eq 0 && "${REFERENCE_OUTPUT}" = "${output}" ]]
    then printf "${RESULT_FMT}" "$duration" "$CMD" "SUCCESS"
    else
        printf "${RESULT_FMT}" "-" "$CMD" "FAILURE"
        printf '%-12s - %s\n' "$INPUT_FILE" "$CMD" >> "${ERROR_LOGFILE}"
    fi
}

run_case() {
    echo "${INPUT_FILE}:"
    for CMD in uniq $(ls uniq*)
    do run_cmd
    done | sort
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
then
    echo "Failed tests:"
    cat "${ERROR_LOGFILE}"
    exit 1
fi
