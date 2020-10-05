class Solution {
    // Top-down Recursive DP method with memo is actually pretty quick compared to other submissions.
    // Because of product, which can change depending on cell value (- or +) we need to keep track of BOTH
    // min and max values (as in each step they can revert due to multiplication with negative number).
    func maxProductPath(_ grid: [[Int]]) -> Int {
        var memo = Array(repeating: Array(repeating: (Int.min,Int.min), count: grid[0].count), count: grid.count)
        var maxResult = Int.min
        
        func helper(_ i: Int, _ j: Int) -> (Int, Int) {
            if i == grid[0].count - 1 && j == grid.count - 1 {
                return (grid[j][i], grid[j][i])
            }
            if memo[j][i] != (Int.min,Int.min) { return memo[j][i] }

            let thisCell = grid[j][i]
            // go down if possible
            var v1 = (Int.max,Int.min), v2 = v1
            if j + 1 < grid.count { v1 = helper(i, j+1) }
            // go right if possible
            if i + 1 < grid[0].count { v2 = helper(i+1, j) }
            let minMax = thisCell < 0 ? (thisCell * max(v1.1, v2.1), thisCell * min(v1.0, v2.0)) : (thisCell * min(v1.0, v2.0), thisCell * max(v1.1, v2.1))
            memo[j][i] = minMax
            return minMax
        }
        
        let minMax = helper(0,0)

        maxResult = minMax.1
        return maxResult >= 0 ? maxResult % (1000000000 + 7) : -1
    }
}

let i: [[Int]] = [[2,1,3,0,-3,3,-4,4,0,-4],[-4,-3,2,2,3,-3,1,-1,1,-2],[-2,0,-4,2,4,-3,-4,-1,3,4],[-1,0,1,0,-3,3,-2,-3,1,0],[0,-1,-2,0,-3,-4,0,3,-2,-2],[-4,-2,0,-1,0,-3,0,4,0,-3],[-3,-4,2,1,0,-4,2,-4,-1,-3],[3,-2,0,-4,1,0,1,-3,-1,-1],[3,-4,0,2,0,-2,2,-4,-2,4],[0,4,0,-3,-4,3,3,-1,-2,-2]]
let i2 = [[1, 3],
          [0,-4]]
let i3: [[Int]] = [[2,1,4,0,-1,0,-2,3,2,-4,4,0,3,2,-2],[2,-1,-4,4,1,3,0,0,-4,3,1,3,-3,0,-4],[-3,-4,1,-1,-3,3,-3,-4,3,1,0,1,1,0,-2],[3,3,-1,3,-4,4,-4,0,-3,-1,2,-4,2,4,3],[-3,4,0,-3,2,4,2,-4,-1,0,4,0,-3,0,-1],[4,2,-4,0,-3,-3,3,4,1,-1,4,4,-1,-2,0],[-1,-1,-4,2,-2,-1,3,2,0,0,-4,3,-1,1,-1],[3,-2,2,-2,-4,-4,1,-4,4,4,-2,3,-2,-1,0],[2,0,1,3,2,-3,-1,3,4,-1,-2,3,0,-1,-1],[3,3,0,-3,-2,0,3,-4,2,-2,-2,0,0,4,3],[-1,4,-1,2,-4,-4,-2,1,-3,3,3,2,-1,3,2],[-4,0,-2,-3,-1,-1,4,3,-4,-1,-1,4,-1,3,2],[0,2,-2,2,4,4,3,-3,0,-2,-4,0,-3,1,-1],[4,-2,-1,1,-2,-4,-1,2,-2,-4,1,3,3,1,1],[3,3,-4,2,4,2,3,-4,-3,-4,-2,0,-3,-1,3]]

let i4 = [[1,-2,1],
          [1,-2,1],
          [3,-4,1]], o4 = 8

let i5 = [[-1,-2,-3],
          [-2,-3,-3],
          [-3,-3,-2]], o5 = -1


let s = Solution()
print("Tests started!!")
print("Test 1")
assert(s.maxProductPath(i) == 19215865)
print("Test 2")
assert(s.maxProductPath(i2) == 0)
print("Test 4")
assert(s.maxProductPath(i4) == o4)
print("Test 5")
assert(s.maxProductPath(i5) == o5)

print(s.maxProductPath(i3))

print("Tests done!!")
