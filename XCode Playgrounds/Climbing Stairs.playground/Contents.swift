class Solution {
    var memo = Array(repeating: 0, count: 46)
    func climbStairs(_ n: Int) -> Int {
        if n == 0 { return 0 }
        if n == 1 { return 1 }
        if n == 2 { return 2 }
        if memo[n] != 0 { return memo[n] }
        memo[n] = climbStairs(n - 1) + climbStairs(n - 2)
        return climbStairs(n - 1) + climbStairs(n - 2)
    }
}

// Constraints
// 1 <= n <= 45

let s = Solution()
let i = 2, o = 2
let i2 = 3, o2 = 3
let i3 = 20, o3 = 10946
let i4 = 45, o4 = 1836311903

assert(s.climbStairs(i) == o)
assert(s.climbStairs(i2) == o2)
assert(s.climbStairs(i3) == o3)
assert(s.climbStairs(i4) == o4)

print("tests done!")
