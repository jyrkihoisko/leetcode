class Solution {
    
    func uniquePathsIII(_ grid: [[Int]]) -> Int {
        
        // Key here is to NOT to use a memo, and to provide a local
        // copy of visited-map to each iteration (otherwise we will concern finding one OPTIMAL route, here
        // we are concerned to find ALL plausible routes that go over all walkable cells.
        // Swift does a copy of the grid only if it is modified.
        var openCount = 0
        var start = (0,0)
        
        for j in 0..<grid.count {
            for i in 0..<grid[0].count {
                let content = grid[j][i]
                if content == 0 || content == 2 { openCount += 1 }
                if content == 1 { start = (i,j) }
            }
        }
        
        return move(start.0, start.1, grid, openCount)
    }

    func move(_ x: Int, _ y: Int, _ g: [[Int]], _ openCount: Int) -> Int {

        // check if this is a valid path
        if x < 0  || y < 0 || y >= g.count || x >= g[0].count { return 0 }
        if g[y][x] == -1 || g[y][x] == 3 { return 0 }

        // we found an end
        if g[y][x] == 2 {
            if openCount == 0 {
                return 1
            }
            return 0
        }
        var g = g   // make our own copy
        g[y][x] = 3 // mark it moved.

        var partialResult = 0
        
        // attempt to move north
        partialResult += move(x, y-1, g, openCount-1)
 
        // attempt to move south
        partialResult += move(x, y+1, g, openCount-1)
 
        // attempt to move west
        partialResult += move(x-1, y, g, openCount-1)
 
        // attempt to move east
        partialResult += move(x+1, y, g, openCount-1)
        
        return partialResult
    }
}

let i4 = [[1,0,0],
          [0,0,0],
          [0,0,2]], o4 = 2

let i = [[1,0,0,0],
         [0,0,0,0],
         [0,0,0,2]], o = 4

let i2 = [[1,0,0,0],
          [0,0,0,0],
          [0,0,2,-1]], o2 = 2

let i3 = [[0,1],
          [2,0]], o3 = 0

let i5 = [[1]], o5 = 0


let s = Solution()
print("Tests started!")
assert(s.uniquePathsIII(i4) == o4)
print("------")
assert(s.uniquePathsIII(i) == o)
print("2------")
assert(s.uniquePathsIII(i2) == o2)
print("Tests ended!")
/*
 1 <= grid.length * grid[0].length <= 20
 */
