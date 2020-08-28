class Solution {
    func tictactoe(_ moves: [[Int]]) -> String {
        
        var grid = Array(repeating: Array(repeating: 0, count: 3), count: 3)        
        var i = 0
        
        while i < moves.count {
            // place player A move
            let aMove = moves[i]
            grid[aMove[0]][aMove[1]] = 1
        
            if i + 1 < moves.count {
                i += 1
                // place player B move
                let bMove = moves[i]
                grid[bMove[0]][bMove[1]] = 2
            }
            i += 1
        }
        
        // Check if there's winning conditions
        if testIfWins(1, grid) == true { return "A" }
        if testIfWins(2, grid) == true { return "B" }
        if moves.count < 9 {
            return "Pending"
        }
        return "Draw"
    }
    
    func testIfWins(_ token: Int, _ grid: [[Int]]) -> Bool {
        var playerWins = true
        
        // Test all rows
        for j in 0...2 {
            playerWins = true
            for i in 0...2 {
                print("testing row \(j); column: \(i)")
                if grid[j][i] != token {
                    playerWins = false
                    break
                }
            }
            if playerWins == true {
                return true
            }
        }
        // Test all columns
        for j in 0...2 {
            playerWins = true
            for i in 0...2 {
                if grid[i][j] != token {
                    playerWins = false
                    break
                }
            }
            if playerWins == true {
                return true
            }
        }

        // Test both diagonals
        if grid[0][0] == token && grid[1][1] == token && grid[2][2] == token {
            return true
        }
        if grid[0][2] == token && grid[1][1] == token && grid[2][0] == token {
            return true
        }
        return false
    }
}

let moves = [[0,0],[2,0],[1,1],[2,1],[2,2]], o = "A"
let moves2 = [[0,0],[1,1],[0,1],[0,2],[1,0],[2,0]], o2 = "B"
let moves3 = [[0,0],[1,1],[2,0],[1,0],[1,2],[2,1],[0,1],[0,2],[2,2]], o3 = "Draw"
let moves4 = [[0,0],[1,1]], o4 = "Pending"
let s = Solution()

print("Tests started!")
assert(s.tictactoe(moves) == o)
assert(s.tictactoe(moves2) == o2)
assert(s.tictactoe(moves3) == o3)
assert(s.tictactoe(moves4) == o4)
print("Tests done!")

/*
 1 <= moves.length <= 9
 moves[i].length == 2
 0 <= moves[i][j] <= 2
 There are no repeated elements on moves.
 moves follow the rules of tic tac toe.
 */
