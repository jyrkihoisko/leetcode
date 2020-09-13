class Solution {
    /*
     Pre-sorting all elements and using stack as suggested by classic Computer Science theories.
     Not the fastest run-time by any means, but short and sweet implementation. Due to value -type nature of Swift, we need to pop and push the last element in stack instead of modifying it in-place.
     */
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        guard intervals.count > 0 else { return newInterval.count > 0 ? [newInterval] : intervals }
        var sorted = (intervals + [newInterval]).sorted { $0[0] < $1[0] }
        var stack = [sorted.removeFirst()]
        var stackTop = stack.last!
        
        for interval in sorted {
            if interval[0] > stackTop[1] {
                stack.append(interval)  // intervals do not overlap, insert as is.
                stackTop = interval
            } else {                    // intervals do overlap, merge
                stackTop[1] = max(interval[1], stackTop[1])
                stack.removeLast()      // update the last element of the stack
                stack.append(stackTop)
            }
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
assert(s.insert(intervals, newInterval) == output)
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
