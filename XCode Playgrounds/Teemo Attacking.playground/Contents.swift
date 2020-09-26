class Solution {

    // ideal solution
    func findPoisonedDurations(_ timeSeries: [Int], _ duration: Int) -> Int {
        var totalPoisonTime = 0
        for i in 1..<timeSeries.count {
            totalPoisonTime += min(timeSeries[i] - timeSeries[i-1], duration)
        }
        totalPoisonTime += duration // the last index
        return totalPoisonTime
    }
    
    // ideal solution as one-liner
    func findPoisonedDuration(_ timeSeries: [Int], _ duration: Int) -> Int {
        return timeSeries.count == 0 ? 0 : timeSeries.reduce( (-timeSeries.first!,0) ) { ($0.0 + min(duration, $1 - $0.1), $1) }.0 + duration
    }
    
// Works: But not ideal
//    func findPoisonedDuration(_ timeSeries: [Int], _ duration: Int) -> Int {
//        var poisonedUntil = 0
//        var totalPoisonTime = 0
//        var poisonouStarted = 0
//
//        for attack in timeSeries {
//            if attack > poisonedUntil {
//                totalPoisonTime += poisonedUntil - poisonouStarted
//                poisonouStarted = attack
//            }
//            poisonedUntil = attack + duration
//        }
//        totalPoisonTime += poisonedUntil - poisonouStarted
//
//        return totalPoisonTime
//    }
}

print("Tests Started!")
let s = Solution()
print("Test1")

print(s.findPoisonedDuration([1,4], 2)) // 4
print("Test2")
print(s.findPoisonedDuration([1,2], 2)) // 3
print(s.findPoisonedDuration([1,2,3,4,5,6,7], 10)) // 3

print("Tests ended!")
