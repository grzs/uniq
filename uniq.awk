#! /usr/bin/awk -f

BEGIN { line prev_line }
{
    line = $0
    if (line != prev_line) print line
    prev_line = line
}
