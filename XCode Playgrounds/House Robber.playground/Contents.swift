class Solution {
// Iterative DP
//    func rob(_ nums: [Int]) -> Int {
//        guard nums.count > 1 else { return nums.count == 1 ? nums[0] : 0 }
//
//        var dp = [nums[0], max(nums[0], nums[1])]
//        for i in 2..<nums.count {
//            dp.append(max(dp[i-1], dp[i-2] + nums[i]))
//        }
//        print(dp.last!)
//        return dp.last!
//    }
// Recursive solution
    var memo = [Int]()
    var memoCount = 0

    func rob(_ nums: [Int]) -> Int {
        guard nums.count > 0 else { return 0 }

        memo = Array(repeating: -1, count: nums.count)
        return max(recurse(0, nums), recurse(1, nums)) // start from first or second house
    }

    func recurse(_ i: Int, _ nums: [Int]) -> Int {
        if i >= nums.count { print(memoCount); return 0 }
        if memo[i] != -1 { return memo[i] }

        // Rob the next possible; or the one after that
        let maxSum = max(recurse(i + 2, nums), recurse(i + 3, nums)) // jump over one or two houses
        memo[i] = maxSum + nums[i]
        return memo[i]
    }
}



print("Tests started!")
let s = Solution()
assert(s.rob([1,2,3,1]) == 4)
assert(s.rob([2,7,9,3,1]) == 12)
assert(s.rob([2]) == 2)
assert(s.rob([2,7]) == 7)
assert(s.rob([]) == 0)
let houses = Array(1...100)
print(houses)
print(s.rob(houses))
s.rob([1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22])

print("Tests ended!")
