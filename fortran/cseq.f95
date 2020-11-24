! Collatz Sequencer in Fortran
! Nolan Donley
! Input: None
! Output: Top 5 smallest integers under 5 Billion with the longest collatz sequence
!
! To compile:
! gfortran -O2 cseq.f95
!
! To run:
! ./a.out

program collatzSequencer
    implicit none
    integer(8) :: startingNum, j, out, sOut, max = 5e9 ! integers for iteration and one for 5 billion
    integer(8) :: i = 0, count = 1, outputCount = 10 ! integers for iteration, sequence length, and number of indexes in output
    integer(8), dimension(1132) :: smallest = 0 ! array of size : max collatz sequence for 10^10
    integer(8), dimension(10) :: lengths = 0, indexes = 0, sortedIndexes = 0 !arrays of top 10 lengths' starting numbers, top 10 lengths' starting Numbres sorted, top 10 lengths

    ! iterate from 1 to 5 billion and add the starting number to its length array index in smallest
    do startingNum = 1, max
      i = startingNum
      ! calculate the sequence length
      do while (i /= 1)
        count = count + 1
        if (mod(i,2) .eq. 0) then
          i = i / 2
        else
          i = ((3 * i) + 1) / 2
          count = count + 1
        end if
      end do

      ! store the first starting num that results in that length in length index of smallest
      if (smallest(count) == 0) then
        smallest(count) = startingNum
      end if
      count = 0
    end do

    ! move top 10 lengths and starting numbers to lengths and indexes respectivly

    do j = size(smallest), 1, -1
      if (smallest(j) /= 0) then
        if (outputCount > 0) then
          lengths(outputCount) = j
          indexes(outputCount) = smallest(j)
          outputCount = outputCount - 1
        end if
      end if
    end do

    ! Print out top 10 sorted by lengths
    print "(2a15)", "Length", "Starting"

    do out = 1, size(lengths)
      print "(2i15)", lengths(out), indexes(out)
    end do

    ! Sort the starting nums
    sortedIndexes = indexes
    call BubbleSort(indexes)

    ! Print out top 10 sorted by starting nums
    print "(2a15)", "Starting", "Length"

    do out = 1, size(indexes)
      do sOut = 1, size(sortedIndexes)
        if (indexes(out) == sortedIndexes(sOut)) then
          print "(2i15)", indexes(out), lengths(sOut)
        end if
      end do
    end do

contains

  subroutine BubbleSort(a)
    integer(8), intent(in out), dimension(10) :: a
    integer(8) :: temp
    integer(8) :: i, j
    logical :: swapped

    do j = size(a)-1, 1, -1
      swapped = .false.
      do i = 1, j
        if (a(i) > a(i+1)) then
          temp = a(i)
          a(i) = a(i+1)
          a(i+1) = temp
          swapped = .true.
        end if
      end do
      if (.not. swapped) exit
    end do
  end subroutine BubbleSort

end program collatzSequencer
