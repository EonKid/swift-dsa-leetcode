import Foundation

/**
 
 Binary search is an efficient algorithm used to find the position of a target value within a sorted array. It works by repeatedly dividing the search interval in half. If the target value is less than the value in the middle of the interval, the search continues in the lower half, or if the target value is greater, it continues in the upper half. This process is repeated until the target value is found or the interval is empty.
 
 Performs a binary search on a sorted array to find the index of a given key using recursion.
 
 - Parameters:
    - A: The sorted array of integers in which to search.
    - low: The lower bound index of the array segment being searched.
    - high: The upper bound index of the array segment being searched.
    - key: The integer value to search for in the array.
 
 - Returns: The index of the key if it is found in the array. Returns `-1` if the key is not found.
 
  Complexity:
    - Time complexity: O(log n)
    - Space complexity: O(log n)
 */

func binarySearchRecursive(A: [Int], low: Int, high: Int, key: Int) -> Int{
    if low > high{
        return -1
    }
    let mid = Int(floor(Double(low + (high - low)/2)))
    if A[mid] == key{
        return mid
    }else if key < A[mid]{
        return binarySearchRecursive(A: A, low: low, high: mid - 1, key: key)
    }else{
        return binarySearchRecursive(A: A, low: mid + 1, high: high, key: key)
    }
}

/**
 Performs a binary search on a sorted array to find the index of a given key using an iterative approach.
 
 - Parameters:
    - A: The sorted array of integers in which to search.
    - key: The integer value to search for in the array.
 
 - Returns: The index of the key if it is found in the array. Returns `-1` if the key is not found.
 
 
Complexity:
    - Time complexity: O(log n)
    - Space complexity: O(1)
 */
func binarySearchIterative(_ A: [Int], _ key: Int) -> Int{
    var low = 0
    var high = A.count - 1
    while low < high {
        let mid = Int(floor(Double(low + (high - low)/2)))
        if key == A[mid]{
            return mid
        }else if key < A[mid]{
            high = mid - 1
        }else {
            low = mid + 1
        }
    }
    return -1
}

let array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
let key = 5
let result = binarySearchRecursive(A: array, low: 0, high: array.count - 1, key: key)
print("Key \(key) found at index: \(result)") // Expected output: Key 5 found at index: 4

let keyNotInArray = 11
let resultNotInArray = binarySearchRecursive(A: array, low: 0, high: array.count - 1, key: keyNotInArray)
print("Key \(keyNotInArray) found at index: \(resultNotInArray)") // Expected output: Key 11 found at index: -1

print("Binary search iterative: \(binarySearchIterative(array, 11))")

array.first
