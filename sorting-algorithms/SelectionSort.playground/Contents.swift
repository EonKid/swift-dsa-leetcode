import Foundation

/**
 Sorts an array of integers in ascending order using the Selection Sort algorithm.

 The Selection Sort algorithm divides the input array into a sorted and an unsorted region. It repeatedly selects the smallest element from the unsorted region and swaps it with the first unsorted element, effectively expanding the sorted region by one element after each iteration.

 - Parameter A: An inout array of integers that will be sorted in place.

 ### Selection Sort Algorithm
 1. Iterate over the array from the first to the last element.
 2. For each element at index `i`, assume it is the smallest in the unsorted region.
 3. Find the actual smallest element in the unsorted region (from `i` to the end of the array).
 4. Swap the smallest element found with the element at index `i`.
 5. Repeat until the array is sorted.

 ### Time Complexity
 - Best Case: O(n^2)
   The best case occurs when the array is already sorted. However, the algorithm still needs to scan each element to find the minimum in each iteration.
 - Average Case: O(n^2)
   The average time complexity is O(n^2) because, on average, the algorithm must compare each element with every other element.
 - Worst Case: O(n^2)
   The worst case occurs when the array is sorted in reverse order. The algorithm still performs O(n^2) comparisons.

 ### Space Complexity
 - Space Complexity: O(1)
   Selection Sort is an in-place sorting algorithm that does not require any additional space proportional to the input size; it only uses a constant amount of extra space.

 - Note: Selection Sort is not a stable sorting algorithm because it can change the relative order of equal elements.

 - Complexity analysis:
   - Time: O(n^2) for all cases (best, average, worst).
   - Space: O(1) auxiliary.

 ### Example Usage

 var numbers = [64, 25, 12, 22, 11]
 selectionSort(&numbers)
 print(numbers) // Output: [11, 12, 22, 25, 64]

*/
func selectionSort(_ A: inout [Int]){
    for i in 0 ..< A.count {
        var minIndex = i
        for j in i + 1 ..< A.count {
            if A[j] < A[minIndex]{
                minIndex = j
            }
        }
        (A[i], A[minIndex]) = (A[minIndex], A[i])
    }
}

var A = [7,1,2,5,4]
selectionSort(&A)
print("Sorted array using selection sort algorithms: \(A)")
