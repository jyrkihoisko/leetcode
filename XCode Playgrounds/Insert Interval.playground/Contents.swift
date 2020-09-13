class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        guard intervals.count > 0 else { return newInterval.count > 0 ? [newInterval] : intervals }
        // Intervals are guaranteed to be sorted ascending by starting time.
        var ptr = 0
        var count = intervals.count
        var interval = newInterval
        
        var processed = false
        var stack = [[Int]]() //[intervals[0]]
        
        while ptr < count {
            var currInterval = intervals[ptr]
            
            if interval[0] < currInterval[0] && interval[1] < currInterval[0] && processed == false {
                stack.append(interval)
                stack.append(currInterval)
                processed = true
                print("added new interval \(interval) to stack \(ptr)")
            } else if interval[1] <= currInterval[1] && processed == false { // overlap, curr larger
                currInterval[0] = min(interval[0], currInterval[0]) // merge
                stack.append(currInterval)
                processed = true
                print("merged at \(ptr); interval: \(interval); merged: \(currInterval)")
            } else if interval[1] > currInterval[1] && interval[0] <= currInterval[1] { // overlap, new larger
                interval[0] = min(interval[0], currInterval[0])
                print("absorbed at \(ptr); interval: \(interval); orig: \(currInterval)")
            } else {
                print("adding currInterval: \(currInterval) to stack")
                stack.append(currInterval)
            }
            ptr += 1
        }
        if processed == false {
            stack.append(interval)
        }
        
        print(stack)
        return stack
    }
}

let intervals = [[1,3],[6,9]], newInterval = [2,5], output = [[1,5],[6,9]]
let intervals2 = [[1,2],[3,5],[6,7],[8,10],[12,16]], newInterval2 = [4,8], o2 = [[1,2],[3,10],[12,16]]
let intervals3 = [[Int]](), newInterval3 = [1,2], o3 = [[1,2]]
let intervals4 = [[1,2]], newInterval4 = [0,2], o4 = [[0,2]]
let intervals5 = [[0,3]], newInterval5 = [1,2], o5 = [[0,3]]
let intervals6 = [[Int]](), ni6 = [Int](), o6 = [[Int]]()

let i7 = [[1,5]], ni7 = [5,7], o7 = [[1,7]]
let i8 = [[5,7]], ni8 = [1,5], o8 = [[1,7]]
let i9 = [[0,3]], ni9 = [0,2], o9 = [[0,3]]
let ia = [[0,2]], nia = [0,3], oa = [[0,3]]
let ib = [[0,5]], nib = [2,5], ob = [[0,5]]
let ic = [[2,5]], nic = [0,5], oc = [[0,5]]


print("Tests started!")
let s = Solution()
//assert(s.insert(intervals, newInterval) == output)
assert(s.insert(intervals2, newInterval2) == o2)
assert(s.insert(intervals3, newInterval3) == o3)
assert(s.insert(intervals4, newInterval4) == o4)
assert(s.insert(intervals5, newInterval5) == o5)
print(s.insert(intervals6, ni6))
assert(s.insert(i7, ni7) == o7)
assert(s.insert(i8, ni8) == o8)
assert(s.insert(i9, ni9) == o9)
assert(s.insert(ia, nia) == oa)
assert(s.insert(ib, nib) == ob)
assert(s.insert(ic, nic) == oc)


print("Tests ended!")
