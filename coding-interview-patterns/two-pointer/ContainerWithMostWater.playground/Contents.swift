/**
 Problem: Given n non-negative integers a1, a2, ..., an where each represents a point at coordinate (i, ai), find two lines that, together with the x-axis, form a container, such that the container contains the most water.
 
 Example 1:
 Input: height = [1,8,6,2,5,4,8,3,7]
 Output: 49
 Explanation: The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7]. In this case, the max area of water (blue section) the container can contain is 49.
 
 Example 2:
 Input: height = [1,1]
 Output: 1

 */



func maxArea(_ height: [Int]) -> Int {

    var left = 0
    var right = height.count - 1
    var result = Int.min

    while left < right {

        let width = right - left
        let area = min(height[left], height[right]) * width
        result = max(result, area)

        if height[left] < height[right] {
            left += 1
        }else {
            right -= 1
        }

    }

    return result
    
}

var height = [1,8,6,2,5,4,8,3,7]
print("Conainter with max water: \(maxArea(height))")


