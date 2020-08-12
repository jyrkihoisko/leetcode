class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        guard numRows > 0 else { return []}
        guard numRows > 1 else { return [[1]]}

        var rows = [[1],[1,1]] // n = 2 or more
        
        for i in 1..<numRows-1 {
            var nums = [1]
            for a in 0..<rows[i].count - 1 {
                nums.append(rows[i][a] + rows[i][a+1])
            }
            rows.append(nums + [1])
        }
        return rows
    }
}
