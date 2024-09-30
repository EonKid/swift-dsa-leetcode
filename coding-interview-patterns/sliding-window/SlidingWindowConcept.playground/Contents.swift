import Foundation

/*
Problem:  Maximum Sum Subarray of Size K

 Sliding Window pattern:
 
 The Sliding Window pattern is commonly used to solve problems involving arrays or lists, where you're tasked with finding a subarray or a range of elements. It reduces the time complexity by avoiding unnecessary repeated calculations, typically transforming an O(n^2) approach into O(n).

 Here’s a breakdown of the Sliding Window technique:

 Steps:
 Define the window: This is a range (start and end pointers) over the array.
 Expand the window: Move the end pointer to include new elements.
 Shrink the window (if necessary): Move the start pointer to remove elements and maintain window properties.
 Track the result: During the process, keep track of any relevant calculations (e.g., maximum sum, minimum size, etc.).
 
 Key Concepts:
 Window Start (windowStart): Marks the beginning of the sliding window.
 Window End (windowEnd): Marks the end of the sliding window, which expands as we iterate.
 Window Size (k): This could represent the size of the window, depending on the problem.
 Sum/Count/Other Metrics: A variable to keep track of the current state inside the window (e.g., sum, frequency, etc.).
 Result Calculation: After processing the window, compute the result (e.g., max sum, min subarray length, etc.).

 Time Complexity
 The time complexity of the above algorithm will be O(N).

 Space Complexity
 The algorithm runs in constant space O(1).
 */

func slidingWindowPattern(_ numbers: [Int], _ k: Int) -> Int{
    var maxSum = 0
    var windowStart = 0
    var windowEnd = 0
    var windowSum = 0
    
    for windowEnd in 0 ..< numbers.count {
        
        windowSum  += numbers[windowEnd]
        
        if windowEnd >= k - 1 {
            maxSum = max(windowSum, maxSum)
            windowSum -= numbers[windowStart]
            windowStart += 1
        }
    }
    return maxSum
}

//Given an array, find the maximum sum of any contiguous subarray of size k.
let numbers = [2, 1, 5, 1, 3, 2]
let k = 3
let maxSumV = slidingWindowPattern(numbers, k)
print(maxSumV) // Output: 9 (Subarray [5, 1, 3])


/**
 Problem Statement #
 Given a string, find the length of the longest substring in it with no more than K distinct characters.

 Example 1:

 Input: String="araaci", K=2
 Output: 4
 Explanation: The longest substring with no more than '2' distinct characters is "araa".

 Example 2:

 Input: String="araaci", K=1
 Output: 2
 Explanation: The longest substring with no more than '1' distinct characters is "aa".

 Example 3:

 Input: String="cbbebi", K=3
 Output: 5
 Explanation: The longest substrings with no more than '3' distinct characters are "cbbeb" & "bbebi".
 
 Time Complexity
 The time complexity of the above algorithm will be O(N) where ‘N’ is the number of characters in the input string.
 The outer for loop runs for all characters and the inner while loop processes each character only once, therefore the time complexity of the algorithm will be O(N+N) which is asymptotically equivalent to O(N).

 Space Complexity
 The space complexity of the algorithm is O(K), as we will be storing a maximum of ‘K+1’ characters in the HashMap.
 */

func longestSubStringWithKDistinctCharacters(_ s: String, _ k: Int) -> Int{
    var windowStart = 0
    var windowEnd = 0
    var charFrequency: [Character: Int] = [:]
    var maxLength = Int.min
    var charsData = Array(s)
    
    for windowEnd in 0 ..< charsData.count {
        
        let currentChar = charsData[windowEnd]
        charFrequency[currentChar, default: 0] += 1
        
        while charFrequency.count > k {
            
            let char = charsData[windowStart]
            charFrequency[char]! -= 1
            if charFrequency[char] == 0 {
                charFrequency[char] = nil
            }
            windowStart += 1
            
        }
        maxLength = max(maxLength, windowEnd - windowStart + 1)
    }
    
    return maxLength
    
}

let maxLengthSubstring = longestSubStringWithKDistinctCharacters("araaci", 2)
print("Longest substring with K distinct characters: \(maxLengthSubstring)")
