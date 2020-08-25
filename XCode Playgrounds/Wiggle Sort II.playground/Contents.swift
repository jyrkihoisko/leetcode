class Solution {
    
    func wiggleSort(_ nums: inout [Int]) {
        let mySorted = nums.sorted()
        let middle = (nums.count / 2) - 1
        var ar1ptr = middle + (nums.count % 2 > 0 ? 1 : 0)
        var ar2ptr = mySorted.count - 1

        for i in 0..<nums.count {
            if i % 2 == 0 {
                if ar1ptr < 0 { continue }
                nums[i] = mySorted[ar1ptr]
                // Note: We interleave these two sub-sections from end to begin! This is essential!
                // (See test input: "4,5,5,6" and "4,4,5")
                ar1ptr -= 1
            } else {
                if ar2ptr >= nums.count { continue }
                nums[i] = mySorted[ar2ptr]
                // Note: We interleave these two sub-sections from end to begin! This is essential!
                ar2ptr -= 1
            }
        }
    }
}

var i = [1, 5, 1, 1, 6, 4], o = [1, 4, 1, 5, 1, 6]
var i3 = [1, 5, 1, 1, 6, 4, 5], o3 = [4,6,1,5,1,5,1]
var i2 = [1, 3, 2, 2, 3, 1], o2 = [2, 3, 1, 3, 1, 2]//[1, 2, 1, 3, 2, 3] //[2, 3, 1, 3, 1, 2]
var i4 = [1,2,2,1,2,1,1,1,1,2,2,2], o4 = [1,2,1,2,1,2,1,2,1,2,1,2]
var i5 = [4,5,5,6], o5 = [5,6,4,5]
var i6 = [4,4,5], o6 = [4,5,4]
var i7 = [1], o7 = [1]

let s = Solution()
print(i3)
s.wiggleSort(&i3)
print(i3)
assert(i3 == [4, 6, 1, 5, 1, 5, 1]) //[5, 6, 4, 5, 1, 5, 1])
s.wiggleSort(&i4)
print(i4)
assert(i4 == o4) // !!
s.wiggleSort(&i2)
print(i2)
assert(i2 == o2) //!!
print("output")
print(i2)
assert(i4 == o4)

s.wiggleSort(&i5)
assert(i5 == o5)
print(i5)

s.wiggleSort(&i7)
assert(i7 == o7)

print("output")
print(i3)


print("Tests done!")


/*
 "Given an unsorted array nums, reorder it such that nums[0] < nums[1] > nums[2] < nums[3]....
 [0] < [1] > [2] < [3] > [4] < [5] > [6]
 -7     1    -6     2    -5     3     -4
 Can you do it in O(n) time and/or in-place with O(1) extra space?
 */
