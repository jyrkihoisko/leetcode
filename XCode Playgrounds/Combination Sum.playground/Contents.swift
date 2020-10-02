class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        // Backtracking using DFS.
        // Key here is to avoid navigating to indexes in combinations which
        // we have investigated. That's why helper keeps track of the index. This
        // enables us to neatly avoid duplicates as well. Also, values are kept outside of
        // the helper as Array copy operations can be costly. (for each iteration we restore
        // the values candidate in the helper.
        
        var result = [[Int]]()
        let cands = candidates.sorted()
        var values = [Int]()
        
        func helper(_ sum: Int, _ index: Int) {
            if sum > target { return }
            if sum == target {
                result.append(values)
            }
            for i in index..<cands.count {
                let c = cands[i]
                if c + sum <= target {
                    values.append(c)
                    helper(sum + c, i)
                    values.removeLast()
                }
            }
        }
        
        helper(0, 0)
        return result
    }
}
