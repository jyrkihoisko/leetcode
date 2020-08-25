class Solution {
    var rects: [[Int]]
    var rectAreas: [Int]
    var numOfPoints = 0
    
    init(_ rects: [[Int]]) {
        self.rects = rects
        rectAreas = [Int]()
        for rect in rects {
            let area = (rect[2] - rect[0] + 1) * (rect[3] - rect[1] + 1) // number of points
            rectAreas.append(area)
            numOfPoints += area
        }
    }
    
    func pick() -> [Int] {
        var coordIndex = Int.random(in: 0..<numOfPoints)
        var rectIndex = 0
        for a in rectAreas {
            coordIndex -= a
            if coordIndex < 0 { break }
            rectIndex += 1
        }
        let rect = rects[rectIndex]
        let x = Int.random(in: rect[0]...rect[2])
        let y = Int.random(in: rect[1]...rect[3])
        return [x,y]
    }
}
/**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution(rects)
 * let ret_1: [Int] = obj.pick()
 */

// Another solution, a bit more elegant (from LeetCode discussions)
// as it accumulates the total area in subsequent rectangles, which makes
// the picking tiny bit faster (no need to find the rectangle index
/*
 class Solution {
     var rects: [[Int]]
     var areas: [Int]
     var totalArea = 0
     init(_ rects: [[Int]]) {
         self.rects = rects
         areas = [Int]()
         
         for rect in rects {
             totalArea += (rect[2] - rect[0] + 1) * (rect[3] - rect[1] + 1)
             areas.append(totalArea)
         }
     }
     
     func pick() -> [Int] {
         let random = Int.random(in: 0..<totalArea)
         
         for (index, area) in areas.enumerated() {
             if area > random {
                 let rect = rects[index]
                 let x = Int.random(in: rect[0]...rect[2])
                 let y = Int.random(in: rect[1]...rect[3])
                 return [x, y]
             }
         }
         
         return []
     }
 }
 */


let i1 = [[-2,-2,-1,-1],[1,0,3,0],[3,3,5,5]] //x1, y1, x2, y2
let i2 = [[0,0,0,0], [1,1,1,1]]
let s = Solution(i1)
for _ in 0..<10 {
    print(s.pick())
}
let s2 = Solution(i2)
for _ in 0..<10 {
    print(s2.pick())
}

//assert(s.)
print("Tests done!")
