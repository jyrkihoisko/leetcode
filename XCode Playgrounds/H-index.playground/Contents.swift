import Foundation

class Solution {
    func hIndex(_ citations: [Int]) -> Int {
        let sorted = citations.sorted(by: >)
        var prevI = 0
        
        for i in 0..<sorted.count {
            if sorted[i] >= i + 1 {
                print("\(sorted[i]) == \((i + 1))")
                prevI = i + 1
            }
            if sorted[i] < i + 1 {
                print("\(sorted[i]) < \((i + 1)); breaking")
                break
            }
        }
        print(prevI)
        return prevI
    }
}


let s = Solution()
let i = [3,0,6,1,5], e = 3 //6,5,3,1,0
let i3 = [10,8,5,4,3], e3 = 4
let i2 = [3,0,3,6,1,5], e2 = 3
let i4 = [28,8,5,3,3], e4 = 3 // 3


assert(s.hIndex(i) == e)
assert(s.hIndex(i3) == e3)
assert(s.hIndex(i4) == e4)
assert(s.hIndex(i2) == e2)


print("tests dones!")
