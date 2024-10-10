#!/bin/bash

uniq () {
    local line prev_line
    while read line
    do test "${line}" = "${prev_line}" || echo $line
       prev_line="${line}"
    done
}

uniq
