class Solution {

    var memo = [Int]()
    func minDays(_ n: Int) -> Int {
        var ret = 0
        memo = Array(repeating: -1, count: 10001)

        // Three options each day:
        // 1. eat 1 orange
        // 2. if remaining orages divisible by 2, then eat n/2
        // 3. if remaining oranges divibisble by 3, then eat 2 * n / 3
        ret = eatingRecurse(n)
        print("Eating days: \(ret)")
        return ret
    }
    
    
    func eatingRecurse(_ oranges: Int) -> Int {
        if oranges == 0 { return 0 }
        if oranges == 1 {
            return 1
        }
        if memo[oranges] >= 0 { return memo[oranges] }
        
        var option1 = Int.max
        var option2 = Int.max
        var option3 = Int.max
        
        if oranges % 2 == 0 {
            let eatingCount = oranges/2
            option1 = eatingRecurse(oranges - eatingCount)
        }
        if oranges % 3 == 0 {
            let eatingCount = 2 * oranges / 3
            option2 = eatingRecurse(oranges - eatingCount)
        }
        option3 = eatingRecurse(oranges - 1)
        memo[oranges] = min(option1, option2, option3) + 1
        return min(option1, option2, option3) + 1
        
    }
}


let s = Solution()
let i = 10, o = 4
let i2 = 6, o2 = 3
let i3 = 1, o3 = 1
let i4 = 56, o4 = 6
let i5 = 1000, o5 = 10
let i6 = 9999, o6 = 14

//let i7 = 69652, o7 = 25

assert(s.minDays(i) == o)
assert(s.minDays(i2) == o2)
assert(s.minDays(i3) == o3)
assert(s.minDays(i4) == o4)
assert(s.minDays(i5) == o5)
assert(s.minDays(i6) == o6)
//assert(s.minDays(i7) == o7)


print("Tests Done!")

// 1 <= n <= 2*10^9 !!

/*
 There are n oranges in the kitchen and you decided to eat some of these oranges every day as follows:

 Eat one orange.
 If the number of remaining oranges (n) is divisible by 2 then you can eat  n/2 oranges.
 If the number of remaining oranges (n) is divisible by 3 then you can eat  2*(n/3) oranges.
 You can only choose one of the actions per day.

 Return the minimum number of days to eat n oranges.
 */
