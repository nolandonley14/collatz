// Collatz Sequencer in Go
// Nolan Donley
// Input: None
// Output: Top 5 smallest integers under 5 Billion with the longest collatz sequence
//
// To compile:
// go build cseq.go
//
// To run:
// ./cseq

package main

import "fmt"
import "sort"

func main() {

  var startingNum int = 1 // starting iterator
  const max int = 5000000000 // 5 Billion
  var count int = 0 // Sequence counter
  var outputCount int = 9 // number of indexes in output

  lengths := make([]int, 10) // array for of top 10 lengths' starting numbers
  indexes := make([]int, 10) // array for top 10 lengths
  sortedIndexes := make([]int, 10) //  array for top 10 lengths' starting Numbres sorted
  smallest := make([]int, 1132) // array of size : max collatz sequence for 10^10

  // iterate from 1 to 5 billion and add the starting number to its length array index in smallest
  for startingNum = 1; startingNum <= max; startingNum++ {
    i := startingNum
    // calculate the sequence length
    for i != 1 {
      count++
      if i%2 == 0 {
        i = i / 2
      } else {
        i = ((3*i)+1)/2
        count++
      }
    }
    //store the first starting num that results in that length in length index of smallest
    if smallest[count] == 0 {
      smallest[count] = startingNum
    }
    count = 0
  }

  //move top 10 lengths and starting numbers to lengths and indexes respectivly
  for j := len(smallest) - 1; j >= 0; j-- {
    if smallest[j] != 0 && outputCount >= 0 {
        lengths[outputCount] = j
        indexes[outputCount] = smallest[j]
        outputCount--
    }
  }

  //  Print out top 10 sorted by lengths
  fmt.Printf("%11s%17s\n", "Length", "Starting")

  for i := range lengths {
    fmt.Printf("%15d%15d\n", lengths[i], indexes[i])
  }

  //  Sort the starting nums
  copy(sortedIndexes, indexes)
  sort.Ints(sortedIndexes)

// Print out top 10 sorted by starting nums
fmt.Printf("%12s%15s\n", "Starting", "Length")

  for out := 0; out < len(sortedIndexes); out++ {
    for sOut := 0; sOut < len(indexes); sOut++ {
      if sortedIndexes[out] == indexes[sOut] {
        fmt.Printf("%15d%15d\n", sortedIndexes[out], lengths[sOut])
      }
    }
  }
}
