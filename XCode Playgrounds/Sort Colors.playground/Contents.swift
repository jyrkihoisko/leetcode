class Solution {
    func sortColors(_ nums: inout [Int]) {
        var ar = [0,0,0]
        for num in nums {
            ar[num] += 1
        }
        var i = 0, j = 0
        while j < nums.count {
            if ar[i] > 0 {
                nums[j] = i
                ar[i] -= 1
                j += 1
            } else {
                i += 1
            }
        }
    }
}
