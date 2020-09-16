//Purely out of academic interest and nerd fun... DO NOT DO STUFF LIKE THIS IN PRODUCTION CODE! :)
class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        return (nums.reduce((nums.count, 0)) { ($0.0^$1^$0.1, $0.1+1) }).0
    }
}

/*
 Tiny bit more comprehensible version of above:
 //        var ret = nums.count
 //        for i in 0..<nums.count {
 //            ret ^= i ^ nums[i]
 //        }
 //        return ret
 */
