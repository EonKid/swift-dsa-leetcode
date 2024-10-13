import Cocoa
/**

 #### **Problem Statement:**
 The goal of this function is to generate **all permutations** of a given input string. A permutation is a unique arrangement of the characters, where the order of characters matters. For a string of length \(n\), there are \(n!\) (factorial) possible permutations.

 This solution uses **recursion** to explore all possible ways to arrange the characters.

 ---

 ### **Function Definition:**

 ```swift
 func permute(_ soFar: [Character], _ remaining: [Character]) {
     if remaining.isEmpty {
         print(String(soFar))
     } else {
         for i in 0..<remaining.count {
             // Create a new permutation by adding the current character to soFar
             var nextSoFar = soFar
             nextSoFar.append(remaining[i])
             
             // Create a new remaining array excluding the used character
             var next = remaining
             next.remove(at: i)
             
             // Recursive call with the updated arrays
             permute(nextSoFar, next)
         }
     }
 }

 // Example usage
 permute([], Array("abc"))
 ```

 ---

 ### **Explanation of the Logic:**

 1. **Input Parameters:**
    - `soFar`: A list of characters representing the current permutation being built.
    - `remaining`: A list of characters that are yet to be added to the current permutation.

 2. **Base Case:**
    - If the `remaining` array is empty, it means the current permutation is complete. The function prints the permutation by converting `soFar` to a string.

 3. **Recursive Case:**
    - For each character in the `remaining` array:
      1. **Add the current character** to the `soFar` list.
      2. **Remove the current character** from the `remaining` list.
      3. **Recursive Call:** Continue building the permutation with the updated `soFar` and `remaining` lists.

 ---

 ### **Example Execution:**

 Given the input string `"abc"`, the recursive process explores all possible character orders.

 permute([], "abc")
 ├── permute(["a"], "bc")
 │   ├── permute(["a", "b"], "c")
 │   │   └── permute(["a", "b", "c"], "") → prints "abc"
 │   └── permute(["a", "c"], "b")
 │       └── permute(["a", "c", "b"], "") → prints "acb"
 ├── permute(["b"], "ac")
 │   ├── permute(["b", "a"], "c")
 │   │   └── permute(["b", "a", "c"], "") → prints "bac"
 │   └── permute(["b", "c"], "a")
 │       └── permute(["b", "c", "a"], "") → prints "bca"
 └── permute(["c"], "ab")
     ├── permute(["c", "a"], "b")
     │   └── permute(["c", "a", "b"], "") → prints "cab"
     └── permute(["c", "b"], "a")
         └── permute(["c", "b", "a"], "") → prints "cba"


 **Output:**
 ```
 abc
 acb
 bac
 bca
 cab
 cba
 ```

 ---

 ### **Time Complexity Analysis:**

 1. **Number of Recursive Calls:**
    - Each character can appear in any position, resulting in \(n!\) permutations for an input of size \(n\).

 2. **Time to Print Each Permutation:**
    - Printing each permutation takes \(O(n)\) time (converting the array to a string).

 Thus, the **overall time complexity** is:
 \[
 O(n \times n!)
 \]

 ---

 ### **Space Complexity Analysis:**

 1. **Call Stack Depth:**
    - The depth of the recursion is \(n\), where each level adds one character to `soFar`.

 2. **Temporary Arrays:**
    - At each level, a new copy of `soFar` and `remaining` is created, but the space used at any point depends only on the recursion depth.

 Thus, the **space complexity** is:
 \[
 O(n)
 \]

 ---

 ### **Summary:**

 This function generates all permutations of a given input string using recursion. It systematically builds permutations by including each character in all possible positions and explores all combinations.

 #### **Usage Example:**
 ```swift
 permute([], Array("abc"))
 ```

 **Expected Output:**
 ```
 abc
 acb
 bac
 bca
 cab
 cba
 ```

 ---

 ### **Complexity Recap:**
 - **Time Complexity:** \(O(n \times n!)\)
 - **Space Complexity:** \(O(n)\)
 */
func permute(_ soFar:  [Character], _ remaining:  [Character]){
    if remaining.count == 0{
        print("\(String(soFar))")
    }else {
        for i in 0 ..< remaining.count {
            
            var nextSoFar = soFar
            nextSoFar.append(remaining[i])
            
            var next = remaining
            next.remove(at: i)
            permute(nextSoFar, next)
        }
    }
    
}

permute([], Array("abcd"))
