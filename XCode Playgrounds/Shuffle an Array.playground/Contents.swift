class Solution {

    var origNums: [Int]
    
    init(_ nums: [Int]) {
        self.origNums = nums
    }
    
    /** Resets the array to its original configuration and return it. */
    func reset() -> [Int] {
        return origNums
    }
    
    /** Returns a random shuffling of the array. */
    func shuffle() -> [Int] {
        var nums = origNums
        // FISHER-YATES
        // return origNums.shuffled()  <-- WE COULD USE THIS IN SWIFT, BUT THIS WOULD DEFEAT THE PURPOSE OF THIS EXERCISE
        for i in 0..<nums.count {
            nums.swapAt(i,Int.random(in: 0..<nums.count)) // Note: swap(&num[i], &num[j]) will crash
        }
        return nums
    }
}

/**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution(nums)
 * let ret_1: [Int] = obj.reset()
 * let ret_2: [Int] = obj.shuffle()
 */
let nums = [1,2,3,4,5,6,7,8,9,10]
let s = Solution([1,2,3,4,5,6,7,8,9,10])
print(s.shuffle())
//print(s.nums)
print(s.shuffle())
print(s.nums)
print(s.reset())
//print(s.nums)
