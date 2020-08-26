class Solution {
    // Use two nested loops o(n^2) nested with two pointer traversal.
    // Execution complexity ~o(n^3)
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        guard nums.count > 3 else { return [[Int]]() }
        var ret = [[Int]]()
        let sorted = nums.sorted()
        var prev = [Int]()
        
        for i in 0..<sorted.count - 3 {
            let a = sorted[i]
            for j in i+1..<sorted.count - 2 {
                let b = sorted[j]
                
                var high = sorted.count - 1
                var low = j + 1
                
                // implement two-pointers.
                while low < high {
                    let c = sorted[low]
                    let d = sorted[high]
                    if a+b+c+d > target {
                        high -= 1
                    } else if a+b+c+d < target {
                        low += 1
                    } else {
                        let myNums = [a,b,c,d].sorted()
                        if prev != myNums {
                            ret.append(myNums)
                        }
                        prev = myNums
                        low += 1 // check other potential values
                        high -= 1 // check other potential values
                    }
                }
            }
        }
        
        // Sort the results for eliminating duplicates.
        ret.sort { (ar1, ar2) -> Bool in
            if (ar1[0]*1000+ar1[1]*100+ar1[2]*10+ar1[3]) > (ar2[0]*1000+ar2[1]*100+ar2[2]*10+ar2[3]) {
                return false
            }
            return true
        }
        var i = ret.count - 1
        prev = [Int]()
        while i >= 0 {
            if ret[i] == prev {
                ret.remove(at: i + 1)
            }
            prev = ret[i]
            i -= 1
        }

        print(ret)
        return ret
    }
}

// NOTE: The solution set must not contain duplicate quadruplets.

let s = Solution()
let i = [1, 0, -1, 0, -2, 2], t = 0, o = [[-2, -1, 1, 2], [-2, 0, 0, 2], [-1, 0, 0, 1]]
let i2 = [0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7], t2 = 8
let i3 = [0, 0, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7,8,8,9,10,11,12,13,14,15,16], t3 = 9
let i4 = [-500,-495,-489,-472,-466,-449,-439,-435,-435,-413,-406,-381,-369,-353,-335,-311,-306,-260,-258,-231,-205,-189,-180,-165,-165,-164,-146,-141,-126,-121,-116,-100,-83,-23,-17,18,53,65,91,124,139,140,164,168,200,202,211,216,221,224,249,251,280,282,300,314,323,348,355,373,401,416,428,443,443,445,462,491,497], t4 = -1864
print("Started!")
assert(s.fourSum(i, t) == o)
s.fourSum(i2, t2)
s.fourSum(i3, t3)
s.fourSum(i4, t4)

print("Tests done!")



// TRASHCAN:
/*
     // THIS IS ACTUALLY ALMOST AS BAD AS O(N^4)! DO NOT DO THIS.
     let MULTI = 1000000
     func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
         guard nums.count > 3 else { return [[Int]]() }
         
         var ret = [[Int]]()
         var abMap = [Int : Int]()
         var cdMap = [Int : Int]()
         let myNums = nums.sorted() // o(n * nlog)
         
         for i in 0..<myNums.count - 3 {
             for j in (i+1)..<myNums.count - 2 {
                 abMap[i * MULTI + j] = myNums[i] + myNums[j]
             }
         }
         // o(n^2)
         for i in 2..<myNums.count - 1 {
             for j in (i+1)..<myNums.count {
                 cdMap[i * MULTI + j] = (myNums[i] + myNums[j])
             }
         }
         // o(~~n^4) (EACH MAP MAY CONTAIN N*N ENTRIES!! THUS (N*N)^2
         var prev = [Int]()
         for pair1 in abMap {
             for pair2 in cdMap {
                 if pair1.key == pair2.key { continue }
                 let i = pair1.key / MULTI
                 let j = pair1.key % MULTI
                 let k = pair2.key / MULTI
                 let l = pair2.key % MULTI
                 if i == j || i == k || i == l || j == k || j == l || k == l {
                     continue
                 }
                 if pair1.value + pair2.value == target {
                     let a = myNums[i]
                     let b = myNums[j]
                     let c = myNums[k]
                     let d = myNums[l]
                     let cur = [a,b,c,d].sorted()
                     if cur != prev {
                         ret.append(cur)
                     } else { print(" same as before! not adding!") }
                     prev = cur
                 }
             }
         }
         ret.sort { (ar1, ar2) -> Bool in
             if (ar1[0]*1000+ar1[1]*100+ar1[2]*10+ar1[3]) > (ar2[0]*1000+ar2[1]*100+ar2[2]*10+ar2[3]) {
                 return false
             }
             return true
         }
         var i = ret.count - 1
         prev = [Int]()
         while (i >= 0) {
             if ret[i] == prev {
                 ret.remove(at: i + 1)
             }
             prev = ret[i]
             i -= 1
         }
         return ret
     }
 }

 */
