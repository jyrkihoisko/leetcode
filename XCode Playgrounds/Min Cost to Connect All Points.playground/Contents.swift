
class Solution {
    class Vertex: CustomDebugStringConvertible, Equatable {
        static func == (lhs: Vertex, rhs: Vertex) -> Bool {
            if ObjectIdentifier(lhs) == ObjectIdentifier(rhs) { return true }
            return false
        }
        var parent: Vertex?
        var x: Int
        var y: Int
        var size = 1
        init(_ p1: [Int]) {
            self.x = p1[0]; self.y = p1[1]; self.parent = self
        }
        var debugDescription: String {
            return "(\(x),\(y)) parent: (\(parent!.x), \(parent!.y))"
        }
    }
    
//    class Edge: /*Hashable,*/ CustomDebugStringConvertible {
////        static func == (lhs: Edge, rhs: Edge) -> Bool {
////            if ObjectIdentifier(lhs) == ObjectIdentifier(rhs) { return true }
////            return false
////        }
////        public func hash(into hasher: inout Hasher) {
////             hasher.combine(ObjectIdentifier(self).hashValue)
////        }
//
//        var p1: Vertex
//        var p2: Vertex
//        var w = 0
//        var parent: Edge?
//        init(_ p1: Vertex, _ p2: Vertex, _ w: Int) {
//            self.p1 = p1; self.p2 = p2; self.w = w; self.parent = self
//        }
//        var debugDescription: String {
//            return "\(p1) - \(p2); w = \(w)"
//        }
//    }
    
    func findSet(_ v: Vertex) -> Vertex {
        // path compression; return root of the set
        if v.parent != v {
            v.parent = findSet(v.parent!)
            return v.parent!
        } else {
            return v
        }
    }
    
    func union(_ x: Vertex, _ y: Vertex) {
//        let x = findSet(v1)
//        let y = findSet(v2)
        if x == y { return } // sets are already unioned
        if x.size < y.size { //
            x.parent = y
            y.size += x.size
        } else {
            y.parent = x
            x.size += y.size
        }
    }
    
    func minCostConnectPoints(_ points: [[Int]]) -> Int {
        //var edges = [Edge]()
        var edges = [(v1: Vertex, v2: Vertex, w: Int)]()
        var vertices = [Vertex]()
        print("points count: \(points.count)")
        for i in 0..<points.count {
            let v = Vertex(points[i])
            vertices.append(v)
        }
        
        for i in 0 ..< vertices.count - 1 {
            let p1 = vertices[i]
            for j in i + 1 ..< vertices.count {
                let p2 = vertices[j]
                edges.append((p1, p2, abs(p1.x - p2.x) + abs(p1.y - p2.y)))
            }
        }
        print("edges count \(edges.count); vertices: \(points.count)")
        edges.sort { (a, b) -> Bool in
            if a.w < b.w { return true }
            return false
        }
        var minCost = 0

        for edge in edges {
            let rp1 = findSet(edge.v1)
            let rp2 = findSet(edge.v2)
            //print("edge: \(edge); rp1: \(rp1); rp2: \(rp2)")
            if rp1 != rp2 {
                //f.append(edge)
                minCost += edge.w
                union(rp1, rp2)
                //print("  after union: \(rp1), \(rp2)")
                //assert(rp1.parent!.size == rp2.parent!.size)
                if rp1.parent!.size == points.count { print("edge: \(edge.v1), \(edge.v2); w: \(edge.w)  BREAK!!!!!!!!!!!!!!!!!"); break }
            } else {
               print("\(edge.v1) and \(edge.v2) are already in same tree; W: \(edge.w)")
            }
        }
        print("vittu")
//        for edge in f {
//            minCost += edge.w
//        }
        //print(f)
        print(minCost)
        return minCost
    }
    
//    func calcCost(_ p1: Vertex, _ p2: Vertex) -> Int {
//        //return abs(p1[0] - p2[0]) + abs(p1[1] - p2[1])
//        return abs(p1.x - p2.x) + abs(p1.y - p2.y)
//    }
        
}




let points = [[0,0],[2,2],[3,10],[5,2],[7,0]], o = 20
let points2 = [[3,12],[-2,5],[-4,1]], o2 = 18
let points3 = [[0,0],[1,1],[1,0],[-1,1]], o3 = 4
let points4 = [[-1000000,-1000000],[1000000,1000000]], o4 = 4000000
let points5 = [[0,0]], o5 = 0
let points6 = [[0,0],[2,2],[3,10],[5,2],[7,0],[10,20], [22,10], [24,14], [22,9], [2, 13], [32,33], [1,3], [10,14], [14,17], [2,7] ], o6 = 95
let points7: [[Int]] = [[6256,82052],[-72567,67051],[56891,-84722],[-14181,-57490],[48701,-71357],[-35115,-39249],[48670,-47566],[68218,-84224],[9718,-47508],[-60207,-42655],[-89557,35100],[94110,-42326],[85905,40304],[-3280,86284],[-62238,-63066],[9396,-30137],[35643,10621],[14679,82587],[24177,-85619],[-28188,-12948],[7670,-78940],[43752,88047],[70307,-76277],[61605,-20336],[60239,28791],[25726,78037],[-97858,74676],[49879,69618],[-66269,-18976],[-87034,89816],[9413,88124],[-52048,86764],[64218,82210],[14549,-25265],[-89296,-17396],[-88645,85905],[12297,51622],[-21822,51824],[-8360,87665],[-55354,-59360],[-44387,8624],[30147,43718],[95898,-3406],[82551,-54781],[-61829,-66747],[-77203,-80095],[84975,98752],[-44346,12289],[-21147,-39687],[-27000,32686],[-18533,-27199],[-13228,52090],[-76356,-70974],[-70388,-57667],[-16563,-60199],[-32030,-34217],[5880,58845],[35504,-3269],[-56270,-81285],[-40090,44178],[-21789,-58682],[-8161,-6375],[-91627,40409],[-87339,-8631],[21568,96693],[47694,-3063],[48954,1713],[-75893,-62108],[-83159,-88431],[68973,-4155],[15353,2700],[34237,96736],[-46189,-83935],[90591,-77223],[70515,44068],[75514,-75004],[-24784,64551],[98818,-14787],[-9770,80946],[-1190,99223],[58462,36010],[3311,52784],[-82837,-5534],[-58478,340],[79038,-80212],[-27783,-37044],[90834,48402]], o7 = 100
print("Tests started!")
let s = Solution()
assert(s.minCostConnectPoints(points) == o)
assert(s.minCostConnectPoints(points2) == o2)
assert(s.minCostConnectPoints(points3) == o3)
assert(s.minCostConnectPoints(points4) == o4)
assert(s.minCostConnectPoints(points5) == o5)
assert(s.minCostConnectPoints(points6) == o6)
assert(s.minCostConnectPoints(points7) == o7)

print("Tests ended!")

/*
 1 <= points.length <= 1000
 -106 <= xi, yi <= 106
 All pairs (xi, yi) are distinct.
 
 */


/*
 INCORRECT APPROACH; THIS IS NOT RECURSIVE DP PROBLEM
 
     var ret = Int.max
     guard points.count > 1 else { return 0 }
     var calculatedValues = Array(repeating: ([0,0],[0,0]), count: points.count)
     
     for var i in 0..<points.count {
         var p = points[i]
         var tempPoints = points
         tempPoints.remove(at: i)
         //print("  p: \(point), p2: \(p);  cost: \(calCost(point, p))")
        //recurse(tempPoints, partialSum+cost, p, &ret)
         recurse(tempPoints, 0, p, &ret, &calculatedValues)
     }

     
     var tempPoints = points
     tempPoints.removeFirst()
     //recurse(tempPoints, 0, points[0], &ret, &calculatedValues)
     print("minCost: \(ret)")
     return ret
 }
 
 func recurse(_ points: [[Int]], _ partialSum: Int, _ point: [Int], _ ret: inout Int, _ calValues: inout [([Int], [Int])]) -> Int {
     if points.count == 1 {
         let cost3 = calCost(point, points[0])
         print("last point: p: \(point), p2: \(points[0]) cost: \(cost3), partialCost: \(partialSum); total cost: \(partialSum + cost3)")

         ret = min(ret, partialSum + cost3)
         return 0
     }
     
     print("points left: \(points.count); point: \(point)")
    // var minCost = Int.max
     
     for var j in 0..<points.count {
         
         for var i in 0..<points.count {
             var p = points[i]
             var tempPoints = points
             tempPoints.remove(at: i)
             print("  p: \(point), p2: \(p);  cost: \(calCost(point, p))")
             var cost = calCost(point, p)
             var cost2 = recurse(tempPoints, partialSum+cost, p, &ret)
             //print(" points left; \(points.count); cost: \(cost)")
             //minCost = min(minCost, cost)
         }
     }
     return 0
 }

 */
