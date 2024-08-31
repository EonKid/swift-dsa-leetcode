import Foundation

/// Sorts an array of integers in ascending order using the Insertion Sort algorithm.
///
/// The Insertion Sort algorithm is a simple, comparison-based sorting algorithm. It builds
/// a sorted portion of the array one element at a time by comparing each element with the
/// elements in the sorted portion and inserting it into its correct position.
///
/// - Parameter array: The array of integers to be sorted (passed by reference).
///
/// - Complexity:
///   - Time Complexity:
///     - Best Case: O(n) when the array is already sorted.
///     - Average Case: O(n²) when the elements are in a random order.
///     - Worst Case: O(n²) when the array is sorted in reverse order.
///   - Space Complexity: O(1) as it sorts the array in place without requiring additional storage.

func insertionSort(_ A: inout [Int]) {
    for i in 0 ..< A.count {
        let value = A[i]
        var holeIndex = i
        while holeIndex > 0 && A[holeIndex - 1] > value {
            A[holeIndex] = A[holeIndex - 1]
            holeIndex -= 1
        }
        A[holeIndex] = value
    }
}

var A = [7,1,2,6,5]
insertionSort(&A)
print("Insertion sort: \(A)")
