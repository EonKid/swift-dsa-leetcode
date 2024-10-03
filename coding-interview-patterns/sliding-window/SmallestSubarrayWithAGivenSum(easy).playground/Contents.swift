import Foundation

/**
 
 Problem Statement
 Given an array of positive numbers and a positive number ‘S’, find the length of the smallest contiguous subarray whose sum is greater than or equal to ‘S’. Return 0, if no such subarray exists.
 Example 1:

 Input: [2, 1, 5, 2, 3, 2], S=7
 Output: 2
 Explanation: The smallest subarray with a sum great than or equal to '7' is [5, 2].

 Example 2:

 Input: [2, 1, 5, 2, 8], S=7
 Output: 1
 Explanation: The smallest subarray with a sum greater than or equal to '7' is [8].

 Example 3:

 Input: [3, 4, 1, 1, 6], S=8
 Output: 3
 Explanation: Smallest subarrays with a sum greater than or equal to '8' are [3, 4, 1] or [1, 1, 6].

 */

func smallestSubArrayWithGivenSum(_ A: [Int], _ S: Int) -> Int{
    var minLength = Int.max
    
    var windowStart = 0
    var currentSum = 0
    
    for windowEnd in 0 ..< A.count {
        
        currentSum += A[windowEnd]
        
        if currentSum >= S {
            minLength = min(minLength, windowEnd - windowStart + 1)
            currentSum -= A[windowStart]
            windowStart += 1
        }
        
    }
    
    if minLength == Int.max {
        return 0
    }
    
    return minLength
}

let A = [2, 1, 5, 2, 3, 2]
let S = 0

print("smallest contiguous subarray whose sum is greater than or equal to ‘S’: \(smallestSubArrayWithGivenSum(A, S)) ")


