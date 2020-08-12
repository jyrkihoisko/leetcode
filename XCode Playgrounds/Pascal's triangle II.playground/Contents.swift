class Solution {
    func getRow(_ rowIndex: Int) -> [Int] {
        guard rowIndex > 0 else { return [1] }
        
        var res = [1]
        var prev = [Int]()
        prev = getRow(rowIndex - 1)
        if prev.count == 1 { return [1,1] }
        for j in 0..<prev.count - 1 {
            res.append(prev[j] + prev[j + 1])
        }
        return res + [1]
    }
}


let s = Solution()

assert(s.getRow(0) == [1])
assert(s.getRow(1) == [1,1])
assert(s.getRow(2) == [1,2,1])
assert(s.getRow(3) == [1,3,3,1])
assert(s.getRow(4) == [1,4,6,4,1])
assert(s.getRow(5) == [1,5,10,10,5,1])
assert(s.getRow(6) == [1,6,15,20,15,6,1])

print("Tests done!")
