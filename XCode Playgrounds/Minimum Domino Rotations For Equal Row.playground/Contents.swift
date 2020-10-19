class Solution {
    
//    func minDominoRotationsOrig(_ A: [Int], _ B: [Int]) -> Int {
//        var minFlipCount = Int.max
//        
//        here: for val in 1...6 {
//            var flipCountA = 0, flipCountB = 0
//            for (a,b) in zip(A,B) {
//                if a != val && b != val { continue here }
//                if a != val && b == val { flipCountA += 1 }
//                if b != val && a == val { flipCountB += 1 }
//            }
//            minFlipCount = min(minFlipCount, flipCountA, flipCountB)
//        }
//        return minFlipCount < A.count ? minFlipCount : -1
//    }
    
    // TINY MORE OPTIMIZED, RUN-TIME THE SAME AS ABOVE
    func minDominoRotations(_ A: [Int], _ B: [Int]) -> Int {
        var minFlipCount = Int.max
        here: for val in [A[0], B[0]] { // We need to check only two values of the first domino
            var flipCountA = 0, flipCountB = 0
            for (a,b) in zip(A,B) {
                if a != val && b != val { continue here }
                if a != val && b == val { flipCountA += 1 }
                if b != val && a == val { flipCountB += 1 }
            }
            minFlipCount = min(minFlipCount, flipCountA, flipCountB)
        }
        return minFlipCount < A.count ? minFlipCount : -1
    }
    
// Works; but slower than above solution
//        let rows = A.count
//        var retCount = Int.max
//        var histo = [Int: Int]()
//        for (a,b) in zip(A,B) {
//            histo[a, default: 0] += 1
//            if a != b {
//                histo[b, default: 0] += 1
//            }
//        }
//        let values = histo.filter { $0.value >= rows }.map{$0.key}
//        print(values)
//        if values.count == 0 { return -1 }
//
//        for value in values {
//            var tempCount = 0
//
//            for a in A {
//                if value == a { continue }
//                tempCount += 1
//                print("TempCount: \(tempCount), rows: \(rows)")
//            }
//            retCount = min(tempCount, retCount)
//            tempCount = 0
//            for b in B {
//                if value == b { continue }
//                tempCount += 1
//                print("TempCount: \(tempCount), rows: \(rows)")
//            }
//            retCount = min(tempCount, retCount)
//
//        }
//        return retCount
//    }
}

let s = Solution()
assert(s.minDominoRotations([2,1,2,4,2,2], [5,2,6,2,3,2]) == 2)
print("Test 1 done ")
assert(s.minDominoRotations([1,2,1,1,1,2,2,2],
                           [2,1,2,2,2,2,2,2]) == 1)
print("Test 2 done ")
assert(s.minDominoRotations([3,5,1,2,3], [3,6,3,3,4]) == -1)
print("Tests done!")
