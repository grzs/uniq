#! /usr/bin/awk -f

func uniq(line) {
    if (line != prev_line) print line
    prev_line = line
}

BEGIN { line prev_line } { uniq($0) }
