# Collatz

A program to compute the number of items in the Collatz sequence. In other words, computing the numbers in the Collatz sequence for a beginning value and printing out how many numbers there are in the sequence.

**Author: Nolan Donley**

**Input**: None

**Output**: Smallest 10 beginning numbers with the longest collatz sequence sorted by beginning number and sequence length

**I Have also created a google sheet to predict the run times of each of the languages based on measured benchmarks :**
    [Collatz Run Times](https://docs.google.com/spreadsheets/d/1dmGPrR5AuiAofIk__sk0Y6Mv47BZh00KSYefydLqtDY/edit?usp=sharing)

## For Julia:
-To compile and run:
`julia cseq.jl`

## For Go:
-To compile:
`go build cseq.go`

-To run:
`./cseq`

## For Fortran:
-To compile:
`gfortran -O2 cseq.f95`

-To run:
`./a.out`

## For Lisp:
-To compile and run:
`sbcl --script cseq.lisp` 

### With Recursion:
`julia cseqRecursion.jl`

`go build cseqRecusion.go` `./cseqRecursion`

`gfortran -O2 cseqRecursion.f95` `./a.out`

`sbcl --script cseqRecursion.lisp`

## Test Run with Julia
`[]$ julia cseq.jl`

    Length         Starting
            449         818943
            451         546681
            457         970599
            467         767903
            469         511935
            475         910107
            503         704623
            506         939497
            508         626331
            524         837799
    Starting         Length
         511935            469
         546681            451
         626331            508
         704623            503
         767903            467
         818943            449
         837799            524
         910107            475
         939497            506
         970599            457
