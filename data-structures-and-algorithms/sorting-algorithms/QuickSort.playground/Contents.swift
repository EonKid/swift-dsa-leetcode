import Foundation

/**
 Quicksort

 - Sort list by selecting pivot
 - Partition list
 - Arranging element smaller than pivot to left of pivot
 - Arranging element greater than pivot to right of pivot

 Time space complexity

 Best case: n * log(n)
 Average case: n * log(n)
 Worst case: O(n * n)

 Space complexity: log(n)
 */

func findPartitionIndex(_ A: inout [Int], _ startIndex: Int, _ endIndex: Int) -> Int{
    var pivot = A[endIndex]
    var partitionIndex = startIndex
    for i in startIndex ..< endIndex {
        if A[i] <= pivot {
            (A[i], A[partitionIndex]) = (A[partitionIndex], A[i])
            partitionIndex += 1
        }
    }
    (A[partitionIndex], A[endIndex]) = (A[endIndex], A[partitionIndex])
    return partitionIndex
}

func sort(_ A: inout [Int], _ startIndex: Int, _ endIndex: Int ){
    if startIndex >= endIndex { return }
    let partitionIndex = findPartitionIndex(&A, startIndex, endIndex)
    sort(&A, startIndex, partitionIndex - 1)
    sort(&A, partitionIndex + 1, endIndex)
}

var numbers = [7,1,2,4,15,6]
sort(&numbers, 0, numbers.count - 1)
print(numbers)
