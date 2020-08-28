class Solution {
    func trap(_ h: [Int]) -> Int {
        
        if h.count < 3 { return 0 }

        var left = 0
        var leftWallFound = false

        var level = 0
        var trappedWater = 0
        var trappedWaterInLevel = 0
        var potentiallyTrappedWater = 0
        var minLevelBefore = Int.max
        var minLevel = Int.max
        var waterStack = 0
        
        for val in h {
            minLevelBefore = min(val, minLevelBefore)
        }
        for val in h {
            if val == minLevelBefore { continue }
            minLevel = min(val, minLevel)
        }
        
        repeat {            
            level = minLevelBefore
            waterStack = minLevel - minLevelBefore
            minLevelBefore = minLevel
            minLevel = Int.max

            potentiallyTrappedWater = 0
            trappedWaterInLevel = 0
            
            left = 0
            leftWallFound = false
            
            while left <= h.count - 1 {
                print("  analysing x = \(left); value \(h[left]); waterStack: \(waterStack); minLevel: \(minLevel); minLevelBefore: \(minLevelBefore), level: \(level)")
                if h[left] > minLevelBefore {
                    minLevel = min(minLevel, h[left])
                    print("minLevel now \(minLevel)")
                }
                
                if h[left] - level <= 0 {
                    if !leftWallFound {
                        // move right to find a wall
                    } else {
                        // left wall found; water potentially trapped
                        potentiallyTrappedWater += waterStack
                    }
                } else if h[left] - level > 0 {
                    if leftWallFound {
                        print(" collected trapped water: \(potentiallyTrappedWater)")
                        trappedWaterInLevel += potentiallyTrappedWater
                        potentiallyTrappedWater = 0
                    } else {
                        print("    left wall found at \(left)")
                        leftWallFound = true
                    }
                }
                left += 1

            }
            
            print("on level \(level) trapped water: \(trappedWaterInLevel)")
            print("waterStack now = \(waterStack); next: \(minLevel - minLevelBefore)")
            waterStack = minLevel - minLevelBefore
            trappedWater += trappedWaterInLevel
        } while minLevel < Int.max
        print("total trapped water \(trappedWater)")
        return trappedWater
    }
}


let i = [0,1,0,2,1,0,1,3,2,1,2,1], o = 6
let i2 = [0,7,6,5,4,3,2,1,0,0], o2 = 0
let i3 = [1,2,3,4,5,6,7,8,9], o3 = 0
let i4 = [100,80,20,60,30,60,120], o4 = 250
let i5 = [32,1,31], o5 = 30
let i6 = [0,7,1,4,6], o6 = 7
let i7 = [0,0,1,0,0], o7 = 0
let i8 = [0,2,1,2,0], o8 = 1
let i9 = [0,2,3,2,0], o9 = 0


let s = Solution()

print("Tests started!")
assert(s.trap(i) == o)
assert(s.trap(i2) == o2)
assert(s.trap(i3) == o3)
assert(s.trap(i4) == o4)
assert(s.trap(i5) == o5)
assert(s.trap(i6) == o6)
assert(s.trap(i7) == o7)
assert(s.trap(i8) == o8)
assert(s.trap(i9) == o9)

print("Tests done!")
