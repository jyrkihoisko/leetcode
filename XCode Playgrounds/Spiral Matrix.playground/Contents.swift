class Solution {
    enum TravelDirection {
        case right, down, up, left
    }
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        print("---------------")
        if matrix.count == 0 { return [] }
        var visitationMatrix = Array(repeating: Array(repeating: 0, count: matrix[0].count), count: matrix.count)
        visitationMatrix[0][0] = 1
        var result = [Int]()
        recurse(.right, 0,0, &visitationMatrix, matrix, &result)
        return result
    }
    func recurse(_ dir: TravelDirection, _ i: Int, _ j: Int, _ visits: inout [[Int]], _ m: [[Int]], _ res: inout [Int]) {
        // try travel left; if cant' try travle down;, if can't travel right, if can't
        // travel up
        print("\(dir), i: \(i), j: \(j); \(m[0].count); \(m.count)")
        res.append(m[j][i])
        switch dir {
        case .right:
            if i + 1 < m[0].count && visits[j][i + 1] == 0 {
                visits[j][i+1] = 1
                return recurse(.right, i+1, j, &visits, m, &res) // continue right
            }
            if j + 1 < m.count && visits[j+1][i] == 0 {
                visits[j+1][i] = 1
                return recurse(.down, i, j+1, &visits, m, &res) // go down instead
            }
        case .down:
            if j + 1 < m.count && visits[j+1][i] == 0 {
                visits[j+1][i] = 1
                return recurse(.down, i, j+1, &visits, m, &res) // continue down
            }
            if i - 1 >= 0 && visits[j][i-1] == 0 {
                visits[j][i-1] = 1
                return recurse(.left, i-1, j, &visits, m, &res) // go left instead
            }
        case .left:
            if i - 1 >= 0 && visits[j][i-1] == 0 {
                visits[j][i-1] = 1
                return recurse(.left, i-1, j, &visits, m, &res) // continue left
            }
            if j - 1 >= 0 && visits[j-1][i] == 0 {
                visits[j-1][i] = 1
                return recurse(.up, i, j-1, &visits, m, &res) // go up instead
            }
        case .up:
            if j - 1 >= 0 && visits[j-1][i] == 0 {
                visits[j-1][i] = 1
                return recurse(.up, i, j-1, &visits, m, &res) // continue up
            }
            if i + 1 < m[0].count && visits[j][i+1] == 0 {
                visits[j][i+1] = 1
                return recurse(.right, i+1, j, &visits, m, &res) // go right instead
            }
        }
        return // Done
    }
}


let s = Solution()
let i = [
 [ 1, 2, 3 ],
 [ 4, 5, 6 ],
 [ 7, 8, 9 ]
], o = [1,2,3,6,9,8,7,4,5]
let i2 = [
  [1, 2, 3, 4],
  [5, 6, 7, 8],
  [9,10,11,12]
], o2 = [1,2,3,4,8,12,11,10,9,5,6,7]
let i3 = [[1]], o3 = [1]
let i4 = [[1,2,3,4,5,6,7]], o4 = [1,2,3,4,5,6,7]
let i5 = [[1],[2],[3],[4],[5],[6],[7]], o5 = [1,2,3,4,5,6,7]
let i6 = [[Int]](), o6 = [Int]()


assert(s.spiralOrder(i) == o)
print(s.spiralOrder(i))
assert(s.spiralOrder(i2) == o2)
print(s.spiralOrder(i4))
assert(s.spiralOrder(i4) == o4)
assert(s.spiralOrder(i5) == o5)
assert(s.spiralOrder(i3) == o3)
assert(s.spiralOrder(i6) == o6)


print("Tests done!")

