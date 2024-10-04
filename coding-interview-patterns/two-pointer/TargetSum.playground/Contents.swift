/*
 Problem Statement:
 Given an array of sorted numbers and a target sum, find a pair in the array whose sum is equal to the given target. Write a function to return the indices of the two numbers (i.e. the pair) such that they add up to the given target.

 Example 1:
 Input: [1, 2, 3, 4, 6], target=6
 Output: [1, 3]
 Explanation: The numbers at index 1 and 3 add up to 6: 2+4=6

 Example 2:
 Input: [2, 5, 9, 11], target=11
 Output: [0, 2]
 Explanation: The numbers at index 0 and 2 add up to 11: 2+9=11
 
 Time Complexity : O(n)
 Space Complexity: O (1)
 
 */

func twoSum(_ A: [Int], _ T: Int) -> [Int]{
    var leftIndex = 0
    var rightIndex = A.count - 1
    
    while leftIndex < rightIndex {
        let sum = A[leftIndex] + A[rightIndex]
        if sum == T {
            return [leftIndex, rightIndex]
        }else if sum < T {
            leftIndex += 1
        }else {
            rightIndex -= 1
        }
    }
    
    return []
    
}

let A = [2, 5, 9, 11]
let target = 11
print("Two sum: \(twoSum(A, target))")




