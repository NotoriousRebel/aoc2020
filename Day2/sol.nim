import asyncdispatch
import asyncfile
import sequtils
import strutils
import os
import tables

proc chomp*(target: char, word: string): Future[int] {.async.} = 
    # Given a string determine how many times a char occurs
    var counter = 0
    for c in word:
        if c == target:
            inc counter
    result = counter

proc part1(): Future[int] {.async.}= 
    # var letterToCount = initTable[char, int]()
    var isValidCounter = 0
    var file = openAsync("input.txt", fmRead)
    let data = await file.readAll()
    file.close()
    let lines = splitLines(data)
    for line in lines:
        # Example: line: 5-6 g: kgggjg
        let parts = line.split(" ")
        let curCount = await chomp(parts[1][0], parts[2])
        if curCount >= parseInt(parts[0].split("-")[0]) and curCount <= parseInt(parts[0].split("-")[1]):
            echo "Located valid password: ", $line
            inc isValidCounter
    result = isValidCounter

proc main() {.async.} = 
    echo "First part sol: ", await part1()


waitFor main()