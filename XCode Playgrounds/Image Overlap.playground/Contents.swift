class Solution {
    func largestOverlap(_ A: [[Int]], _ B: [[Int]]) -> Int {
        var maxCount = 0
        
        for i in -A.count+1..<A.count {
            for j in -A.count+1..<A.count {
                maxCount = max(maxCount, matchAndCount(A, B, i, j))
            }
        }
        print("MaxCount: \(maxCount)")
        return maxCount
    }
    
    func matchAndCount(_ A: [[Int]], _ B: [[Int]], _ k: Int, _ l: Int) -> Int {
        var count = 0
        let dim = A.count
        for j in l..<dim {
            for i in k..<dim {
                if j >= 0 && j < dim && i >= 0 && i < dim && j-l >= 0 && i-k >= 0 && j-l < dim && i-k < dim {
                    count += A[j][i] & B[j-l][i-k]
                }
            }
        }
        return count
    }
}


let s = Solution()

let i5: [[Int]] = [[1,1,1,1],
                   [1,1,0,0],
                   [1,0,0,0],
                   [0,0,0,0]]
let i6: [[Int]] = [[1,1,0,0],
                   [1,0,0,0],
                   [0,0,0,0],
                   [0,0,0,0]]

let i1: [[Int]] = [[1,1,0,0,0],
                   [1,1,0,0,0],
                   [0,0,0,0,0],
                   [0,0,0,0,0],
                   [0,0,0,0,0]]
let i2: [[Int]] = [[0,0,0,0,0],
                   [0,0,0,0,0],
                   [0,0,1,1,1],
                   [0,0,1,1,1],
                   [0,0,1,1,1]], o2 = 4
let i3 = [[1,1,0],
          [0,1,0],
          [0,1,0]]
let i4 = [[0,0,0],
          [0,1,1],
          [0,0,1]]

let i7: [[Int]] = [[1,0,0,0,0],
                   [0,0,0,0,0],
                   [0,0,0,0,0],
                   [0,0,0,0,0],
                   [0,0,0,0,0]]
let i8: [[Int]] = [[0,0,0,0,0],
                   [0,0,0,0,0],
                   [0,0,0,0,0],
                   [0,0,0,0,1],
                   [0,0,0,0,0]], o8 = 1
let i9: [[Int]] = [[0,0,0,0,0],
                   [0,0,0,0,0],
                   [0,0,0,0,0],
                   [0,0,0,0,0],
                   [1,0,0,0,0]]
let ia: [[Int]] = [[0,0,0,0,1],
                   [0,0,0,0,0],
                   [0,0,0,0,0],
                   [0,0,0,0,0],
                   [0,0,0,0,0]]

let ib = [[1,0],
          [1,0]],
ic = [[1,1],
      [1,0]], ob = 2

//
// 0,1
// 0,1
print("Tests started!")
assert(s.largestOverlap(i5,i6) == 3)
assert(s.largestOverlap(i3,i4) == 3)
assert(s.largestOverlap(i4,i3) == 3)

assert(s.largestOverlap(i1, i2) == o2)
assert(s.largestOverlap(i2, i1) == o2)

assert(s.largestOverlap(i7, i8) == o8)
assert(s.largestOverlap(i8, i7) == o8)

assert(s.largestOverlap(i7, i9) == 1)
assert(s.largestOverlap(i9, i7) == 1)
assert(s.largestOverlap(i9, i8) == 1)
assert(s.largestOverlap(i8, i9) == 1)

assert(s.largestOverlap(ia, i9) == 1)
assert(s.largestOverlap(i9, ia) == 1)

assert(s.largestOverlap(ia, i7) == 1)
assert(s.largestOverlap(i7, ia) == 1)

assert(s.largestOverlap(ib, ic) == ob)
assert(s.largestOverlap(ic, ib) == ob)



print("Tests ended!")
