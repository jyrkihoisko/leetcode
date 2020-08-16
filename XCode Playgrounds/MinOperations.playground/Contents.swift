class Solution {
    func minOperations(_ n: Int) -> Int {
        guard n > 1 else { return 0 }
        var ret = 0
        var arr = Array(repeating: 0, count: n)
        for i in 0..<n {
            arr[i] = (2 * i) + 1
        }
        let middle = arr.count / 2
        let median = (arr.count % 2 == 0) ? ((arr[middle] + arr[middle-1]) / 2) : arr[middle]
        print(arr)
        print(median)
        
        for i in 0..<middle {
            ret += median - arr[i]
        }
        print("return: \(ret)")
        return ret
    }
}



let s = Solution()

let i = 3, o = 2
let i2 = 4, o2 = 4
let i3 = 0, o3 = 0
let i4 = 1, o4 = 0
let i5 = 10000, o5 = 100
assert(s.minOperations(i) == o)
assert(s.minOperations(i2) == o2)
assert(s.minOperations(i3) == o3)
assert(s.minOperations(i4) == o4)
assert(s.minOperations(i5) == 25000000)

print("Tests done!")


/*
 arr[i] = (2 * i) + 1


 In one operation, you can select two indices x and y where 0 <= x, y < n and subtract 1 from arr[x] and add 1 to arr[y] (i.e. perform arr[x] -=1 and arr[y] += 1). The goal is to make all the elements of the array equal. It is guaranteed that all the elements of the array can be made equal using some operations.

 Given an integer n, the length of the array. Return the minimum number of operations needed to make all the elements of arr equal.

  

 */

