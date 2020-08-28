class SolBase {
    func rand7() -> Int {
        return Int.random(in: 1...7)
    }
}
/**
 * The rand7() API is already defined in the parent class SolBase.
 * func rand7() -> Int = {}
 * @return a random integer in the range 1 to 7
 */
class Solution : SolBase {
    func rand10() -> Int {
        let distribution: [[Int]] = [[1,2,3,4,5,6,7],
                                     [8,9,10,1,2,3,4],
                                     [5,6,7,8,9,10,1],
                                     [2,3,4,5,6,7,8],
                                     [9,10,1,2,3,4,5],
                                     [6,7,8,9,10,-1,-1],
                                     [-1,-1,-1,-1,-1,-1,-1]]
        while true {
            let val = distribution[rand7() - 1][rand7() - 1]
            if val != -1 { return val }
        }
    }
}


let s = Solution()
var map = [Int : Int]()
for _ in 0..<10000 {
    let val = s.rand10()
    if map[val] != nil {
        map[val]! += 1
    } else {
        map[val] = 1
    }
}
let m = map.sorted { (a, b) -> Bool in
    if a.key < b.key { return true }
    return false
}
print("map: \(m)")
