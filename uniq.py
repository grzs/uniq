#! /usr/bin/env python3

import sys


def main():
    prev_line = None
    for line in sys.stdin:
        if line != prev_line:
            sys.stdout.write(line)
        prev_line = line

    # this one is for the OG uniq:
    if line and line[:-1] != "\n":
        sys.stdout.write("\n")


def main_while():
    prev_line = None
    while line := sys.stdin.readline():
        if line != prev_line:
            sys.stdout.write(line)
        prev_line = line


if __name__ == "__main__":
    main()
