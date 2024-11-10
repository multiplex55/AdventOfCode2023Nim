import Day1Mod
import Day2Mod
import Day3Mod
import Day3Mod_Part2
import Day4Mod
import Day4Mod_Part2
import Day5Mod
import Day5Mod_Part2

import strutils, strformat, streams, os, times, tables, sequtils, algorithm

when isMainModule:
    var startTimeCPU = cpuTime()
    var startTimeDT = now()

    # echo "Day1Part1 " & $Day1Mod.TrebuchetPart1(os.getCurrentDir() & "\\inputFiles\\day1.txt")
    # echo "Day1Part2 " & $Day1Mod.TrebuchetPart2(os.getCurrentDir() & "\\inputFiles\\day1.txt")
    # echo "Day2Part1 " & $Day2Mod.CubeConundrumPart1(os.getCurrentDir() & "\\inputFiles\\day2.txt")
    # echo "Day2Part2 " & $Day2Mod.CubeConundrumPart2(os.getCurrentDir() & "\\inputFiles\\day2.txt")
    # echo "Day3Part1_Small " & $Day3Mod.GearRatio(os.getCurrentDir() & "\\inputFiles\\day3_small.txt")
    #echo "Day3Part1 " & $Day3Mod.GearRatioPart1(os.getCurrentDir() & "\\inputFiles\\day3.txt")
    #echo "Day3Part2 " & $Day3Mod_Part2.GearRatioPart2(os.getCurrentDir() & "\\inputFiles\\day3_small.txt")
    #echo "Day4 " & $Day4Mod.Scratchcards(os.getCurrentDir() & "\\inputFiles\\day4_small.txt")
    #echo "Day4 " & $Day4Mod.Scratchcards(os.getCurrentDir() & "\\inputFiles\\day4.txt")
    #echo "Day4Part2Small " & $Day4Mod_Part2.Scratchcards(os.getCurrentDir() & "\\inputFiles\\day4_small.txt")
    #echo "Day4Part2Large " & $Day4Mod_Part2.Scratchcards(os.getCurrentDir() & "\\inputFiles\\day4.txt")


    #echo "Day5Part1_Small " & $Day5Mod.IfYouGiveASeedAFertilizer(os.getCurrentDir() & "\\inputFiles\\day5_small.txt")
    #echo "Day5Part1 " & $Day5Mod.IfYouGiveASeedAFertilizer(os.getCurrentDir() & "\\inputFiles\\day5.txt")
    echo "Day5Part2 " & $Day5Mod_Part2.IfYouGiveASeedAFertilizer(os.getCurrentDir() & "\\inputFiles\\day5.txt")

    var endTimeCPU = cpuTime()
    var endTimeDT = now()

    echo endTimeCPU - startTimeCPU
    echo endTimeDT - startTimeDT

