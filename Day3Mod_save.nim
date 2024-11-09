# https://adventofcode.com/2023/day/3
import strutils, strformat, streams, os, times, tables, algorithm,sequtils

type
    Cell = tuple[letter: char, row: int, col: int]
    MergedCell = tuple[number: int, row: int, col: int]

proc CheckForNumbers(engineSchematic: seq[seq[string]], originalRowIndex: int,originalColIndex: int) = 
    var
        numbersEncountered: seq[int]
        characterAtIndex: char
        cells: seq[Cell]
        mergedCells: seq[MergedCell]
    let
        maxRow: int = engineSchematic.len - 1
        maxCol: int = engineSchematic[0].len - 1
 
    echo &"String character {engineSchematic[originalRowIndex][originalColIndex]} index is row {originalRowIndex} col {originalColIndex}" 
    # check in all directions from c

    # check up
    if originalRowIndex - 1 >= 0:
        characterAtIndex = engineSchematic[originalRowIndex-1][originalColIndex][0]
        if characterAtIndex.isDigit():
            echo &"We found a digit - up - {$characterAtIndex}"        
            var 
                currentChar: char
                currentRowIndex = originalRowIndex-1 
                currentColIndex = originalColIndex 

            # Walk left
            echo "Walk left"
            while currentChar != '.':
                currentChar = engineSchematic[currentRowIndex][currentColIndex][0] 
                #echo &"Current Char is {currentChar} Current location is row {currentRowIndex} col {currentColIndex}"
                cells.add((currentChar, currentRowIndex, currentColIndex))
                currentColIndex = currentColIndex - 1

            # Reset indexes 
            currentRowIndex = originalRowIndex-1
            currentColIndex = originalColIndex 
            currentChar = 'x' 

            # Walk Right
            echo "Walk right"
            while currentChar != '.':
                currentChar = engineSchematic[currentRowIndex][currentColIndex][0] 
                #echo &"Current Char is {currentChar} Current location is row {currentRowIndex} col {currentColIndex}"
                cells.add((currentChar, currentRowIndex, currentColIndex))
                currentColIndex = currentColIndex + 1
               
            echo &"Cells before sorting is {cells}"
            cells = cells.sortedByIt(it.col)
            cells = cells.filterIt(it.letter != '.')
            cells = cells.deduplicate()
            #########################
            # Debugging print cells
            for c in cells:
                echo c
            echo &"Cells after sorting is {cells}"
            #########################
            var mergedNumString: string
            apply(cells,proc(item:Cell) = mergedNumString.add($item.letter))
            mergedCells.add((parseInt(mergedNumString),originalRowIndex, originalColIndex))
            #########################
            # Debugging print cells
            for c in mergedCells:
                echo &"Merged cells is {mergedCells}"
            #########################
    # check right
    if originalColIndex + 1 <= maxCol:
        characterAtIndex = engineSchematic[originalRowIndex+1][originalColIndex][0]
        if characterAtIndex.isDigit():
            echo &"We found a digit - right - {$characterAtIndex}"        

    # check down
    if originalRowIndex + 1 <= maxRow:
        characterAtIndex = engineSchematic[originalRowIndex+1][originalColIndex][0]
        if characterAtIndex.isDigit():
            echo &"We found a digit - down - {$characterAtIndex}"        

    # check left
    if originalColIndex - 1 >= 0:
        characterAtIndex = engineSchematic[originalRowIndex][originalColIndex-1][0]
        if characterAtIndex.isDigit():
            echo &"We found a digit - left - {$characterAtIndex}"        

    # check up right
    if originalRowIndex - 1 >= 0 and originalColIndex + 1 <= maxCol:
        characterAtIndex = engineSchematic[originalRowIndex-1][originalColIndex+1][0]
        if characterAtIndex.isDigit():
            echo &"We found a digit - up right - {$characterAtIndex}"        

    # check up left
    if originalRowIndex - 1 >= 0 and originalColIndex - 1 <= maxCol:
        characterAtIndex = engineSchematic[originalRowIndex-1][originalColIndex-1][0]
        if characterAtIndex.isDigit():
            echo &"We found a digit - up left - {$characterAtIndex}"        

    # check down right
    if originalRowIndex + 1 >= 0 and originalColIndex + 1 <= maxCol:
        characterAtIndex = engineSchematic[originalRowIndex+1][originalColIndex+1][0]
        if characterAtIndex.isDigit():
            echo &"We found a digit - down right - {$characterAtIndex}"        

    # check down left
    if originalRowIndex + 1 >= 0 and originalColIndex - 1 <= maxCol:
        characterAtIndex = engineSchematic[originalRowIndex+1][originalColIndex-1][0]
        if characterAtIndex.isDigit():
            echo &"We found a digit - down left - {$characterAtIndex}"        

    echo "-----------------------------------"

proc GearRatio*(fileName: string) :int =
    var 
        sum = 0
        fileStrm = openfilestream(fileName, fmRead)
        line: string
        engineSchematic = @[@[""]]       
        lineCounter: int
    defer: fileStrm.close()

    lineCounter = 0
    # Read file and built engineSchematic
    for line in fileStrm.lines:
        engineSchematic.add(@[""])
        var currentLineArray: seq[string] = @[]
        for ch in line:            
            currentLineArray.add($ch)
        engineSchematic[lineCounter] = currentLineArray
        lineCounter += 1
    discard engineSchematic.pop()

    #Print all sequences
    #for line in engineSchematic:
        #echo &"line: {line}"

    var
        currentRowCounter:int
        currentColCounter:int

    for currentRowCounter,rowV in engineSchematic:
        # echo &"currentRowCounter {currentRowCounter} rowV {rowV}"
        for currentColCounter,colV in engineSchematic[currentRowCounter]:
            # echo &"CurrentColCounter {currentColCounter} colV {colV}" 
            if engineSchematic[currentRowCounter][currentColCounter] != ".":
                if not engineSchematic[currentRowCounter][currentColCounter][0].isDigit:
                   #This is not a dot or digit
                   CheckForNumbers(engineSchematic, currentRowCounter, currentColCounter)
    return sum    

