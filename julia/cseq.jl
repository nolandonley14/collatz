# Collatz Sequencer in Julia
# Nolan Donley
# Input: None
# Output: Top 5 smallest integers under 5 Billion with the longest collatz sequence
#
# To compile and run:
# julia cseq.jl

using Printf
function main()

    max = 5000000000 # 5 Billion
    count = 1 # Number of steps in Sequence Variable
    outputCount = 10 # Number of top indexes to output

    lengths = zeros(Int64, 10) #array of top 10 lengths' starting numbers
    sortedIndexes = zeros(Int64, 10) #array of top 10 lengths' starting Numbres sorted
    indexes = zeros(Int64, 10) # array of top 10 lengths
    smallest = zeros(Int64, 1132) # array of size : max collatz sequence for 10^10

    # iterate from 1 to 5 billion and add the starting number to its length array index in smallest
    for startingNum in 1:max
        i = startingNum
        # calculate the sequence length
        while i != 1
            count += 1
            if i%2 == 0
                i = i / 2
            else
                i = ((3*i)+1)/2
                count+=1
            end
        end

        #store the first starting num that results in that length in length index of smallest
        if smallest[count] == 0
            smallest[count] = startingNum
        end
        count = 1
    end

    # move top 10 lengths and starting numbers to lengths and indexes respectivly
    for j = length(smallest):-1:1
        if smallest[j] != 0
            if outputCount > 0
                lengths[outputCount] = j
                indexes[outputCount] = smallest[j]
                outputCount -= 1
            end
        end
    end

    # Print out top 10 sorted by lengths
    @printf("%11s%17s\n", "Length", "Starting")

    for i = 1:length(lengths)
        @printf("%15d%15d\n", lengths[i]-1, indexes[i])
    end

    #Sort the starting nums
    sortedIndexes = sort(indexes)

    # Print out top 10 sorted by starting nums
    @printf("%12s%15s\n", "Starting", "Length")

    for m in 1:length(sortedIndexes)
        for n in 1:length(indexes)
            if sortedIndexes[m] == indexes[n]
                @printf("%15d%15d\n", sortedIndexes[m], lengths[n]-1)
            end
        end
    end
end
main()
exit(0)
