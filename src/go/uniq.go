package main

import (
	"bufio"
	"fmt"
	"io"
	"log"
	"os"
)

func Uniq() {
	var reader = bufio.NewReader(os.Stdin)
	prevLine := ""
	for {
		line, err := reader.ReadString('\n')
		if err != nil {
			if err == io.EOF {
				break
			} else {
				log.Fatal(err)
			}
		} else if line == "\n" {
			break
		}
		if line != prevLine {
			fmt.Print(line)
		}
		prevLine = line
	}
}

func main() {
	Uniq()
}
