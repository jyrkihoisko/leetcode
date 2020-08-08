class Solution {
    func findKthPositive(_ arr: [Int], _ k: Int) -> Int {
        var l = 0
        var ptr = 0

        for i in 1..<Int.max {
            print("i: \(i)")
            if ptr < arr.count && i == arr[ptr] {
                print("\(i) was found in array")
                ptr += 1
            } else {
                l += 1
                print("error count: \(l); currNum: \(i)")
                if l == k { print("currNum: \(i)"); return i }
            }
        }
        return 0
    }
}



let arr = [2,3,4,7,11], k = 5, o = 9
let arr2 = [1,2,3,4], k2 = 2, o2 = 6
let arr3 = [4,5,6,7], k3 = 2, o3 = 2
let arr4 = [1,2], k4 = 1, o4 = 3


let s = Solution()
assert(s.findKthPositive(arr, k) == o)
assert(s.findKthPositive(arr2, k2) == o2)
assert(s.findKthPositive(arr4, k4) == o4)
print("tests done")


/*
 Conditions:
1 <= arr.length <= 1000
1 <= arr[i] <= 1000
1 <= k <= 1000
arr[i] < arr[j] for 1 <= i < j <= arr.length
*/
