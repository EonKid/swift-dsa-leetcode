import Foundation

/*
Mergesort

Sort using creating new subarray and merge sorted array back to original array

Time complexity:
Best case: n * log(n)
Average case: n * log(n)
Worst case: n * log(n)

Space complexity: O(n)

*/

func merge(_ A: inout [Int], _ L: inout [Int], _ R: inout [Int]){
    var i = 0
    var j = 0
    var k = 0
    
    while i < L.count && j < R.count {
        
        if L[i] <= R[j]{
            A[k] = L[i]
            i += 1
        }else{
            A[k] = R[j]
            j += 1
        }
        k += 1
        
    }
    
    while i < L.count {
        A[k] = L[i]
        i += 1
        k += 1
    }
    
    while j < R.count {
        A[k] = R[j]
        j += 1
        k += 1
    }
    
}

func sort(_ A: inout [Int]){
    let size = A.count
    if size < 2{
        return
    }
    let midIndex = size/2
    var L = Array(repeating: 0, count: midIndex)
    for i in 0 ..< midIndex {
        L[i] = A[i]
    }
    
    var R = Array(repeating: 0, count: size - midIndex)
    for i in midIndex ..< A.count {
        R[i - midIndex] = A[i]
    }
    sort(&L)
    sort(&R)
    merge(&A,&L,&R)
}

var numbers = [7,1,5,12,56]
sort(&numbers)
print("Sorted list: \(numbers)")
