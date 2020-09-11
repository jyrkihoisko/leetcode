class Solution {
    // Optimal solution from LC: Below commented out slow but working sliding window method.
    func maxProduct(_ nums: [Int]) -> Int {
        var lP = 1, rP = 1, maxP = nums[0]
        for i in 0..<nums.count {
            lP *= nums[i]
            rP *= nums[nums.count - 1 - i]
            maxP = max(maxP, lP, rP)
            if lP == 0 {
                lP = 1
            }
            if rP == 0 {
                rP = 1
            }
        }
        return maxP
    }
        
// Sliding Window -variant:
// Works, but timeouts with large data sets.
//
//        guard nums.count > 0 else { return 0 }
//        var maxProduct = Int.min
//        var product = 1
//
//        while i < nums.count {
//            //product /= prevNum
//            product = 1
//            product *= nums[i]
//            maxProduct = max(maxProduct, product)
//
//            if nums[i] == 0 { i+=1; continue }
//
//            for j in i+1..<nums.count {
//                if nums[j] == 0 { break }
//                product *= nums[j]
//
//                maxProduct = max(maxProduct, product)
//                var k = i
//                var tempProduct = product
//                while k < j {
//                    tempProduct /= nums[k]
//                    maxProduct = max(maxProduct, tempProduct)
//                    k += 1
//                }
//            }
//            i += 1
//        }
//        return maxProduct
//    }
}

let s = Solution()

assert(s.maxProduct([2,3,-2,4]) == 6)
assert(s.maxProduct([-2,0,-1]) == 0)
assert(s.maxProduct([1,0,2,1,3,-2,4,1,0]) == 6)
print(s.maxProduct([1,0,-4,-4,3,-2,4,1,0]))
assert(s.maxProduct([0,0,0]) == 0)
assert(s.maxProduct([0,0,9]) == 9)
assert(s.maxProduct([0,9,0]) == 9)
assert(s.maxProduct([9,0,0]) == 9)
assert(s.maxProduct([9]) == 9)
assert(s.maxProduct([0]) == 0)
assert(s.maxProduct([-9]) == -9)
assert(s.maxProduct([-9,1,1,1,1,1,1,1,1,1,1,-9]) == 81)
assert(s.maxProduct([-9,1,1,1,1,1,1,1,1,1,1,9]) == 9)
assert(s.maxProduct([2,3,4,5]) == 120)
print("Tests done!")



