class Solution {
    func containsNearbyAlmostDuplicate(_ nums: [Int], _ k: Int, _ t: Int) -> Bool {
        if nums.count < 1 || k < 1 || t < 0 { return false }

        var left = 0, right = 0
        
        while right < nums.count - 1 {
            let newEntry = nums[right + 1]
            var tempLeft = left
            while tempLeft <= right {
                if abs(newEntry - nums[tempLeft]) <= t { return true }
                tempLeft += 1
            }
            right += 1
            if right >= k { left += 1 }
        }
        
        return false
    }
}
/* REFERENCE SOLUTION THAT USES PRE-SORTING; MUCH MORE EFFICIENT AND PREFERABLE.
class Solution {
    func containsNearbyAlmostDuplicate(_ nums: [Int], _ k: Int, _ t: Int) -> Bool {
        if nums.isEmpty || nums.count < 2 {
            return false
        }
        var indices = [Int](0 ..< nums.count)
        indices = indices.sorted(by: { a, b in nums[a] < nums[b] } )
        
        for i in 0 ..< nums.count {
            var x = indices[i]
            for j in (i + 1) ..< nums.count {
                var y = indices[j]
                var diffNums = nums[y] - nums[x]
                var diffIndex = abs(x - y)
                if diffNums > t {
                     break
                }
                if diffIndex <= k {
                    return true
                }
            }
        }
        return false
    }
}
*/
let s = Solution()

let nums = [1,2,3,1], k = 3, t = 0, o = true
let nums2 = [1,0,1,1], k2 = 1, t2 = 2, o2 = true
let nums3 = [1,5,9,1,5,9], k3 = 2, t3 = 3, o3 = false

assert(s.containsNearbyAlmostDuplicate(nums, k, t) == o)
assert(s.containsNearbyAlmostDuplicate(nums2, k2, t2) == o2)
assert(s.containsNearbyAlmostDuplicate(nums3, k3, t3) == o3)
assert(s.containsNearbyAlmostDuplicate([9,0,0,0,0,9], 7, 8) == true)
assert(s.containsNearbyAlmostDuplicate([9,0,0,0,0,9], 5, 8) == true)
assert(s.containsNearbyAlmostDuplicate([9,0,100,200,300,9], 4, 8) == false)

assert(s.containsNearbyAlmostDuplicate([9,100,200,300,400,9], 5, 8) == true)
assert(s.containsNearbyAlmostDuplicate([-3,100,200,300,400,5], 6, 8) == true)

assert(s.containsNearbyAlmostDuplicate([1,2], 0, 1) == false)
assert(s.containsNearbyAlmostDuplicate([1,2], 1, 1) == true)
assert(s.containsNearbyAlmostDuplicate([1], 1, 1) == false)


print("Tests done!")

