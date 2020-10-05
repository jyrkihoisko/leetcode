class Solution {
    func minOperations(_ logs: [String]) -> Int {
        return logs.reduce(0) { $1 == "../" ? ($0 > 0 ? $0-1 : 0) : ($1 == "./" ? $0 : $0+1) }
    }
}

class Solution2 {
    func minOperations(_ logs: [String]) -> Int {
        return logs.filter({ $0 != "./" }).reduce(0, { $0 + ($1 == "../" ? ($0 > 0 ? -1 : 0) : 1) })
    }
}
