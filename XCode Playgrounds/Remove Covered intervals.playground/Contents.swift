class Solution {
    func removeCoveredIntervals(_ intervals: [[Int]]) -> Int {
//guard intervals.count > 1 else { return intervals.count }
//        let ivs = intervals.sorted { (a, b) in
//            if a[0] < b[0] { return true }
//            if a[0] == b[0] && a[1] < b[1] { return true }
//            return false
//        }
        var ivs = intervals
        // brute force
        var i = 0, j = 0
        while i < ivs.count {
            j = 0
            while j < ivs.count /*&& i < ivs.count*/ {
                if i == j { j += 1; continue }
                print("comparing: \(i) to \(j)")
                if ivs[i][0] <= ivs[j][0] && ivs[i][1] >= ivs[j][1] {
                    print("\(ivs[i][0]), \(ivs[i][1]) contains \(ivs[j][0]),\(ivs[j][1])")
                    ivs.remove(at: j)
                    print("removing \(j)")
                    if i > j { i -= 1 }
                } else {
                    j += 1
                }
            }
            i += 1
        }
        
//        var i = 0
//        while i > ivs.count {
//            if ivs[i][0] <= ivs[i+1][0] && ivs[i][1] >= ivs[i+1][1] {
//                ret += 1
//            }
//
//            i += 1
//        }
        
        return ivs.count
    }
}

let s = Solution()

print("Tests started")
assert(s.removeCoveredIntervals([[1,4],[3,6],[2,8]]) == 2)

print("Test2 started")
assert(s.removeCoveredIntervals([[1,4],[2,3]]) == 1)

print("Test3 started")
assert(s.removeCoveredIntervals([[0,10],[5,12]]) == 2)

print("Test4 started")
assert(s.removeCoveredIntervals([[3,10],[4,10],[5,11]]) == 2)

print("Test5 started")
assert(s.removeCoveredIntervals([[1,2],[1,4],[3,4]]) == 1)

print("Test6 started")
assert(s.removeCoveredIntervals([[34335,39239],[15875,91969],[29673,66453],[53548,69161],[40618,93111]]) == 2)

print("Test7 started")
assert(s.removeCoveredIntervals([[1,2]]) == 1)
print("Test8 started")
assert(s.removeCoveredIntervals([[1,2],[1,2]]) == 1)



print("Tests ended!!!!!!!!!!!")
