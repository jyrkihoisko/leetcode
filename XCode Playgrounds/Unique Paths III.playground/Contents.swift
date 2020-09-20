class Solution {
    var visitMap = [[Int]]()
    
    func uniquePathsIII(_ grid: [[Int]]) -> Int {
        
        // Key here is to use global visitation map (shared by all iterations), and to take a local "snapshot"
        // of the cell we are currently traversing (visitation map) and restoring it before returning from
        // backtracking so other paths can traverse to that location if need be. This way we can avoid creating
        // local copy of the visitation map in each iteration.
        // Here we are attempting to find ALL plausible routes that go over all walkable cells, no optimization.
        // Time complexity O(3^N), space complexity O(N)

        visitMap = grid
        var openCount = 0
        var start = (0,0)
        
        for j in 0..<grid.count {
            for i in 0..<grid[0].count {
                let content = grid[j][i]
                if content == 0 || content == 2 { openCount += 1 }
                if content == 1 { start = (i,j) }
            }
        }
        
        return move(start.0, start.1, openCount)
    }

    func move(_ x: Int, _ y: Int, _ openCount: Int) -> Int {
        // Check if this is a valid path
        if x < 0  || y < 0 || y >= visitMap.count || x >= visitMap[0].count { return 0 }
        if visitMap[y][x] == -1 || visitMap[y][x] == 3 { return 0 }

        if visitMap[y][x] == 2 {            // We found an end
            if openCount == 0 {
                return 1                    // One path found fulfilling requirements
            }
            return 0
        }

        let temp = visitMap[y][x]           // Make a note of this cells status
        visitMap[y][x] = 3                  // Mark it visited for this and child iterations

        var partialResult = 0
        
        // attempt to move north
        partialResult += move(x, y-1, openCount-1)
        // attempt to move south
        partialResult += move(x, y+1, openCount-1)
        // attempt to move west
        partialResult += move(x-1, y, openCount-1)
        // attempt to move east
        partialResult += move(x+1, y, openCount-1)
        
        visitMap[y][x] = temp               // Restore the map so other recursions can visit this cell.
        
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
