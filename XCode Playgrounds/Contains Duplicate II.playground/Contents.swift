class Solution {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        // Unnecessarily complex solution, requires O(nlogn). Use of hash maps allows O(n) processing...
        // This solution uses pre-sorting and two pointers.
        if nums.count < 1 || k < 1 { return false }
        
        var i = 0
        var myNums = nums.compactMap { (a) -> (val: Int, i: Int)? in
            i += 1
            return (a, i - 1)
        }
        myNums.sort { (a, b) -> Bool in a.val > b.val }

        var left = 0, right = 1
        while right < nums.count {
            while right < nums.count && myNums[left].val != myNums[right].val {
                left += 1
                right += 1
            }
            if right == nums.count { return false }
            while right < nums.count && myNums[left].val == myNums[right].val {
                right += 1
            }

            for i in left..<right - 1 {
                for j in i+1..<right {
                    if abs(myNums[i].i - myNums[j].i) <= k { return true }
                }
            }
            left = right
            right += 1
        }
        return false
    }
}

/*
 OPTIMAL SOLUTION:
 USES HASH MAP TO STORE THE INDEX.
 class Solution {
     func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
         var map: [Int: Int] = [:]
         for i in 0..<nums.count {
             if let value = map[nums[i]], i - value <= k {
                 return true
             } else {
                 map[nums[i]] = i
             }
         }
         return false
     }
 }
 */

let s = Solution()
assert(s.containsNearbyDuplicate([1,2,3,1], 3) == true)
assert(s.containsNearbyDuplicate([1,0,1,1], 1) == true)
assert(s.containsNearbyDuplicate([1,2,3,1,2,3], 2) == false)

assert(s.containsNearbyDuplicate([9,0,0,0,0,9], 7) == true)
assert(s.containsNearbyDuplicate([9,0,0,0,0,9], 5) == true)
assert(s.containsNearbyDuplicate([9,0,100,200,300,9], 4) == false)
assert(s.containsNearbyDuplicate([9,100,200,300,400,9], 5) == true)
assert(s.containsNearbyDuplicate([-3,100,200,300,400,5], 6) == false)

assert(s.containsNearbyDuplicate([1,2], 0) == false)
assert(s.containsNearbyDuplicate([1,2], 1) == false)
assert(s.containsNearbyDuplicate([1], 1) == false)
print("TEsts done!")
