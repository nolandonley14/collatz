# Collatz

A program to compute the number of items in the Collatz sequence. In other words, computing the numbers in the Collatz sequence for a beginning value and printing out how many numbers there are in the sequence.

**Author: Nolan Donley**

**Input**: None

**Output**: Smallest 10 beginning numbers with the longest collatz sequence sorted by beginning number and sequence length

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
`go build cseqRecusion.go``./cseqRecursion`
`gfortran -O2 cseqRecursion.f95``./a.out`
`sbcl --script cseqRecursion.lisp`
`sbcl --script formatter.lisp {absolute filepath}`