class Solution {
    func angleClock(_ hour: Int, _ minutes: Int) -> Double {
        var ret: Double = 0.0
        
        let hourAngle: Double = Double(hour%12 * 60 + minutes) / 2.0
        let minutesAngle: Double = 6.0 * Double(minutes)
        
        ret = min(abs(hourAngle - minutesAngle), abs(minutesAngle - hourAngle))
        ret = min(360 - ret, ret)
        
        return ret
    }
}


let hour = 12, minutes = 30, o = 165.0
let hour2 = 3, minutes2 = 30, o2 = 75.0
let hour3 = 3, minutes3 = 15, o3 = 7.5
let hour4 = 4, minutes4 = 50, o4 = 155.0
let hour5 = 12, minutes5 = 0, o5 = 0.0
let hour6 = 1, minutes6 = 59, o6 = 294.5
let hour7 = 1, minutes7 = 57, o7 = 76.5

print("Test started")
let s = Solution()
assert(s.angleClock(hour, minutes) == o)
assert(s.angleClock(hour2, minutes2) == o2)
assert(s.angleClock(hour3, minutes3) == o3)
assert(s.angleClock(hour4, minutes4) == o4)
assert(s.angleClock(hour5, minutes5) == o5)
assert(s.angleClock(hour7, minutes7) == o7)
print("Test finished")
