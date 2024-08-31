import Cocoa

/// Sorts an array of integers in ascending order using the Bubble Sort algorithm.
///
/// The function iterates over the array multiple times, comparing adjacent elements and swapping them
/// if they are in the wrong order. The function stops early if no swaps are needed, indicating the array is sorted.
///
/// - Parameter A: An array of integers to be sorted in-place.
///
/// - Complexity:
///   - Best case: O(n) when the array is already sorted.
///   - Average case: O(n^2) when the array elements are in random order.
///   - Worst case: O(n^2) when the array is sorted in reverse order.
///   - Space complexity: O(1) since sorting is done in-place.

func bubbleSort(_ A: inout [Int]){
    var isSorted = true
    for i in 0 ..< A.count {
        for j in 0 ..< A.count - i - 1 {
            if A[j] > A[j + 1] {
                (A[j], A[j + 1]) = (A[j + 1], A[j]) // swap
                isSorted = false
            }
        }
        if isSorted {
            break
        }
    }
}

var numbers = [9, 1, 5, 0, 2]
bubbleSort(&numbers)
print(numbers)

