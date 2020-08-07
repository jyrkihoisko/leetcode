class Solution {
    // DON'T OVERTHINK THIS ONE!
    func maxProfit(_ prices: [Int]) -> Int {
        var profit = 0
        for i in 0..<prices.count - 1 {
            if prices[i] < prices [i+1] {
                profit += prices[i+1] - prices[i]
            }
        }
        return profit
    }
}


let input = [7,1,5,3,6,4], e = 7
let input2 = [1,2,3,4,5], e2 = 4 // / -slope
let input3 = [7,6,4,3,1], e3 = 0

let s = Solution()
assert(s.maxProfit(input) == e)
assert(s.maxProfit(input2) == e2)
assert(s.maxProfit(input3) == e3)

print("done")


/*
         var localMinimumIndex = -1
         var localMinimumValue = Int.max
         var localMaximumIndex = -1
         var localMaximumValue = Int.min
         let count = prices.count
         var l = 0
         var profit = 0
         
         while l < count - 1 {
             var minFound = false
             var maxFound = false
             var prev = 0

             print("l now: \(l) localMin: \(localMinimumValue), local max: \(localMaximumValue)")
             while l < count - 1 && !minFound {
                 if prices[l + 1] <= prices[l] {
                     l += 1
                     prev = prices[l]
                 } else {
                     localMinimumValue = prev
                     minFound = true
                 }
             }
             while l < count - 1 && !maxFound {
                 if prices[l + 1] > prices[l] {
                     l += 1
                     prev = prices[l]
                 } else {
                     localMaximumValue = prev
                     maxFound = true
                 }
             }
             if minFound && maxFound {
                 print("adding to profit: \(localMaximumValue - localMinimumValue)")
                 profit += localMaximumValue - localMinimumValue
             }
         }
         print("profit: \(profit)")
         return profit
 //
 //        for i in 0..<prices.count {
 //            if prices[i] < localMinimumValue {
 //                localMinimumValue = prices[i]
 //            }
 //            if prices[i] >
 //
 //        }
         
     }

 */



/* BUGS, COMPLICATED. THINK AGAIN
 
 class Solution {
     var localMinimumValue = 0
     var localMaximumValue = 0
     var pointer = 0
     
     func maxProfit(_ prices: [Int]) -> Int {
         
         var localMinimumIndex = -1
         var localMinimumValue = Int.max
         var localMaximumIndex = -1
         var localMaximumValue = Int.min
         let count = prices.count
         var l = 0
         var profit = 0
         
         while pointer < count - 1 {
             if prices[pointer] < prices [pointer+1] { // / -slope
                 localMinimumValue = prices[pointer]
                 pointer += 1
                 // find maximum
                 if findMaximum(prices) {
                     print("Maximum found at \(pointer)")
                     if localMaximumValue > localMinimumValue {
                         print("profit added by \(localMaximumValue - localMinimumValue); now: \(profit)")
                         profit += localMaximumValue - localMinimumValue
                     } else { print("Local max is lower than minimum!! max: \(localMaximumValue); min: \(localMinimumValue)")}
                 }
             } else {  // \ -slope
                 pointer += 1
                 // find minimum
                 if findMinimum(prices) {
                     print("Minimum found at \(pointer-1)")
                     if pointer < count - 1 && findMaximum(prices) { // can we find maximum?
                         if localMaximumValue > localMinimumValue {
                             print("2. profit added by \(localMaximumValue - localMinimumValue); now: \(profit)")
                             profit += localMaximumValue - localMinimumValue
                         } else { print("Local max is lower than minimum!! max: \(localMaximumValue); min: \(localMinimumValue)")}
                     } else {
                         localMaximumValue = prices.last!
                         if localMaximumValue > localMinimumValue {
                             profit += localMaximumValue - localMinimumValue
                         } else { print("3. Local max is lower than minimum!! max: \(localMaximumValue); min: \(localMinimumValue)")}
                     }
                 }
             }
         }
 //
 //        while l < count - 1 {
 //            var minFound = false
 //            var maxFound = false
 //            var prev = 0
 //
 //            print("l now: \(l) localMin: \(localMinimumValue), local max: \(localMaximumValue)")
 //            while l < count - 1 && !minFound {
 //                if prices[l + 1] <= prices[l] {
 //                    l += 1
 //                    prev = prices[l]
 //                } else {
 //                    localMinimumValue = prev
 //                    minFound = true
 //                }
 //            }
 //            while l < count - 1 && !maxFound {
 //                if prices[l + 1] > prices[l] {
 //                    l += 1
 //                    prev = prices[l]
 //                } else {
 //                    localMaximumValue = prev
 //                    maxFound = true
 //                }
 //            }
 //            if minFound && maxFound {
 //                print("adding to profit: \(localMaximumValue - localMinimumValue)")
 //                profit += localMaximumValue - localMinimumValue
 //            }
 //        }
 //        print("profit: \(profit)")
         return profit
 //
 //        for i in 0..<prices.count {
 //            if prices[i] < localMinimumValue {
 //                localMinimumValue = prices[i]
 //            }
 //            if prices[i] >
 //
 //        }
         
     }
     
     func findMinimum(_ prices: [Int]) -> Bool {
         print("find Minimum")
         let count = prices.count
         var minFound = false
         var prev = 0
     
         while pointer < count - 1 && !minFound {
             print("\(pointer): \(prices[pointer]); \(pointer+1): \(prices[pointer + 1])")
             if prices[pointer + 1] <= prices[pointer] {
                 prev = prices[pointer]
             } else {
                 localMinimumValue = (prev != 0 ? prev : prices[pointer])
                 print("local minimum value: \(localMinimumValue)")
                 minFound = true
             }
             pointer += 1
         }
         if pointer == count - 1 { localMinimumValue = prev; minFound = true }
         return minFound
     }
     
     func findMaximum(_ prices: [Int]) -> Bool {
         print("find Maximum")
         let count = prices.count
         var maxFound = false
         var prev = 0
     
         while pointer < count - 1 && !maxFound {
             print("pointer: \(pointer)")
             if prices[pointer + 1] > prices[pointer] {
                 print("hep: \(prices[pointer])")
                 prev = prices[pointer]
             } else {
                 localMaximumValue = (prev != 0 ? prev : prices[pointer])
                 print("local maximum value: \(localMaximumValue)")
                 maxFound = true
             }
             pointer += 1
         }
         if pointer == count - 1 { print("joo"); localMaximumValue = prev; maxFound = true }
         return maxFound
     }

     func maxProfit(_ i: Int, _ prices: [Int]) {
         
     }
 }

 
 */
