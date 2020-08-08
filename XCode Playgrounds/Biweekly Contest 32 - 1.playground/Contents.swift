class Solution {
    func findKthPositive(_ arrr: [Int], _ k: Int) -> Int {
    
        var l = 0
        var ar = arrr
        var a = false
        let v = arrr.last!
        print("last; \(arr.last!)")
        ar.append(v + k)
        
        var expectedNumber = 0
        for i in 0..<ar.count {
            expectedNumber += 1

            print("ar[i] now: \(ar[i]); expectedNymber: \(expectedNumber); l: \(l)")
            if ar[i] == expectedNumber && ar[i] != (v+1) {
                print("arr i was \(expectedNumber) as expected")
                continue
                
            } else if ar[i] != expectedNumber {
                print("\(ar[i]) expected")
                while expectedNumber < ar[i] {
                    l += 1
                    expectedNumber += 1
                    print("  exp: \(expectedNumber); l= \(l)")

                    if ar[i] == k && l == k {
                        // we added k
                        print("  hey!!!!!!!!: \(expectedNumber)")
                        return expectedNumber - 1
                    }
                    if l == k {
                        print("  l = \(l); expected: \(expectedNumber - 1)")
                        return expectedNumber - 1
                    }
                    
                }
            }
        }
        return expectedNumber
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


/*
 Conditions:
1 <= arr.length <= 1000
1 <= arr[i] <= 1000
1 <= k <= 1000
arr[i] < arr[j] for 1 <= i < j <= arr.length
*/
