/**

 #### **Problem Statement:**
 The goal is to generate all possible **subsets** of a given input collection of characters. A subset is a selection of elements (possibly empty) from the input, and the number of subsets for a collection of size \(n\) is \(2^n\). This solution uses **recursion** to explore all combinations of including or excluding each character.

 ---


 ### **Explanation of the Logic:**

 1. **Input Parameters:**
    - `soFar`: A list of characters representing the current subset being constructed.
    - `remaining`: A list of characters yet to be considered for inclusion or exclusion in the current subset.

 2. **Base Case:**
    - If the `remaining` array is empty, the function prints the `soFar` array as a string. This means we’ve reached a subset that is complete.

 3. **Recursive Case:**
    - For each recursive call, the function splits the problem into two branches:
      1. **Include the first character**: Adds the first character of `remaining` to `soFar` and removes it from `remaining`.
      2. **Exclude the first character**: Skips the first character and recursively proceeds with the rest of the characters.

 ---

 ### **Example Execution:**

 Given the input `"abc"`, the recursive tree would look like:

 ```
 subSets([], "abc")
  ├── subSets(["a"], "bc")
  │    ├── subSets(["a", "b"], "c")
  │    │    ├── subSets(["a", "b", "c"], "") → prints "abc"
  │    │    └── subSets(["a", "b"], "") → prints "ab"
  │    └── subSets(["a"], "c")
  │         ├── subSets(["a", "c"], "") → prints "ac"
  │         └── subSets(["a"], "") → prints "a"
  └── subSets([], "bc")
       ├── subSets(["b"], "c")
       │    ├── subSets(["b", "c"], "") → prints "bc"
       │    └── subSets(["b"], "") → prints "b"
       └── subSets([], "c")
            ├── subSets(["c"], "") → prints "c"
            └── subSets([], "") → prints ""
 ```

 **Output:**
 ```
 abc
 ab
 ac
 a
 bc
 b
 c
 (empty line)
 ```

 ---

 ### **Time Complexity Analysis:**
 For each character, the function makes **two recursive calls**: one including the character and one excluding it. Therefore, the number of recursive calls is \(2^n\) for an input of size \(n\).

 - **Time Complexity:** \(O(2^n \cdot n)\)
   - \(2^n\) recursive calls.
   - Each subset takes \(O(n)\) time to print (converting the array to a string).

 ---

 ### **Space Complexity Analysis:**
 - **Call Stack Depth:** The recursion depth is \(O(n)\), where \(n\) is the number of characters.
 - **Space Used by Subsets:** Each subset can take up to \(O(n)\) space to store characters during recursion.

 - **Total Space Complexity:** \(O(n)\) for the recursion depth.

 ---

 ### **Summary:**

 This function generates all possible subsets of a given input by recursively deciding whether to include or exclude each character. The output includes the empty subset, individual elements, and all other combinations.

 #### **Example Usage:**
 ```swift
 subSets([], Array("abc"))
 ```

 **Expected Output:**
 ```
 abc
 ab
 ac
 a
 bc
 b
 c
 (empty line)
 ```
 */
func subSets(_ soFar: [Character], _ remaining: [Character]){
    if remaining.count == 0{
        print("\(String(soFar))")
    }else{
        var nextSoFar = soFar
        nextSoFar.append(remaining[0])
        
        var next = remaining
        next.remove(at: 0)
        //with first character
        subSets(nextSoFar, next)
        
        //without first character
        subSets(soFar, next)
    }
}

subSets([], Array("abc"))

