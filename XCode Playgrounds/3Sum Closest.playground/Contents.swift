class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        let myNums = nums.sorted(by: <)
        var u = Int.max
        var v = 0
        
        for i in 0..<myNums.count - 2 {
            let a = myNums[i]
            var j = i + 1
            var k = myNums.count - 1
            
            while j < k {
                let b = myNums[j]
                let c = myNums[k]

                if b + c == target - a {
                    return target
                }
                let w = target - (a + b + c)
                if abs(w) < u {
                    v = a + b + c
                    u = abs(w)
                }
                if w > 0 { j += 1 } else { k -= 1 }
            }
        }
        return v
    }
}


let nums = [-1,2,1,-4], target = 1, o = 2
let nums2 = [50,100,200,300,400,500,-1,2,1,-4], target2 = 1, o2 = 2
let nums3 = [0,0,1], target3 = 100, o3 = 1
let nums4 = [50,100,200,300,400,500,-1,2,1,-4,34,35,36,37,38,39], target4 = 20, o4 = 29

let s = Solution()
print("Test 1")
assert(s.threeSumClosest(nums, target) == o)
print("Test 2")
assert(s.threeSumClosest(nums2, target2) == o2)
print("Test 3")
assert(s.threeSumClosest(nums3, target3) == o3)
print("Test 4")
assert(s.threeSumClosest(nums4, target4) == o4)

print("Tests done!")

// Each input has only one solution!
/*
 3 <= nums.length <= 1000
 -10^3 <= nums[i] <= 1000
 -10^4 <= target <= 10,000
 */
