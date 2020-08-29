class Solution {
    func pancakeSort(_ A: [Int]) -> [Int] {
        var panCakes = A
        var ret = [Int]()
        var ptr = A.count - 1
        var maxVal = (ind: 0, val: Int.min)
        
        // First find out where is the current largest number
        for (i, val) in A.enumerated() {
            if val > maxVal.val {
                maxVal = (i, val)
            }
        }
        // Flip the numbers so current largest number becomes first; then flip again
        // so current largest number goes to back of the current stack. This way we are
        // sorting the end of the array until we come to the first item. At each step
        // we check if we are in sorted order already.
        while isSorted(panCakes) == false {
            if maxVal.ind != 0 {
                ret.append(maxVal.ind + 1)
                flip(maxVal.ind, &panCakes, maxVal.val)
            }
            let nextMax = flip(ptr, &panCakes, maxVal.val) // move max value to right
            ret.append(ptr + 1)
            ptr -= 1
            maxVal = nextMax
        }
        
        return ret
    }

    func isSorted(_ panCakes: [Int]) -> Bool {
        var prevVal = Int.min
        for i in 0..<panCakes.count {
            if panCakes[i] <= prevVal { return false }
            prevVal = panCakes[i]
        }
        return true
    }
    
    func flip(_ k: Int, _ panCakes: inout [Int], _ maxVal: Int) -> (ind: Int, val: Int) {
        var a = 0, b = k
        var maxValInd = (ind: 0, val: 0)
        while a <= b {
            let maxVal = swapAndReturnMaxIndex(a, b, &panCakes, maxVal)
            if maxVal.val > maxValInd.val {
                maxValInd = maxVal
            }
            a += 1; b -= 1
        }
        return maxValInd
    }
    func swapAndReturnMaxIndex(_ i: Int, _ j: Int, _ panCakes: inout [Int], _ maxVal: Int) -> (ind: Int, val: Int) {
        panCakes.swapAt(i, j)
        if panCakes[i] == maxVal { return (j, panCakes[j]) }
        if panCakes[j] == maxVal { return (i, panCakes[i]) }
        return panCakes[i] > panCakes[j] ? (i, panCakes[i]) : (j, panCakes[j])
    }
}

/* ANOTHER NICE SOLUTION: (Notice use of Array extension)
class Solution {
  func pancakeSort(_ A: [Int]) -> [Int] {
    var A = A
    var flips = [Int]()
    var sortingIndex = A.count - 1

    while sortingIndex >= 0{
      if A[sortingIndex] != sortingIndex + 1{
        let index = A.findIndex(of: sortingIndex + 1)

        if index != 0{
          A.rangeSwapAt(leftIndex: 0, rightIndex: index)
          flips.append(index+1)
        }

        A.rangeSwapAt(leftIndex:0, rightIndex: sortingIndex)
        flips.append(sortingIndex+1)
      }

      sortingIndex -= 1
    }

    return flips
  }
}

private extension Array where Element == Int{
  func findIndex(of target: Int)->Int{
    for i in 0..<self.count{
      if self[i] == target{
        return i
      }
    }
    return -1
  }
  
  mutating func rangeSwapAt(leftIndex: Int, rightIndex: Int){
    var leftIndex = leftIndex
    var rightIndex = rightIndex
    
    while leftIndex < rightIndex{
      self.swapAt(leftIndex, rightIndex)
      leftIndex += 1
      rightIndex -= 1
    }
  }
}
*/


// ATTEMPT TO OPTIMIZE, BUT INTRODUCED A BUG HARD-TO-FIND BUG
//class Solution {
//    func pancakeSort(_ A: [Int]) -> [Int] {
//        var panCakes = A
//        var ret = [Int]()
//        var ptr = A.count - 1
//        var maxVal = (ind: 0, val: Int.min)
//
//        // First find out where is the current largest number
//        for (i, val) in A.enumerated() {
//            if val > maxVal.val {
//                maxVal = (i, val)
//            }
//        }
//print(maxVal)
//        // Flip the numbers so current largest number becomes first; then flip again
//        // so current largest number goes to back of the current stack. This way we are
//        // sorting the end of the array until we come to the first item. At each step
//        // we check if we are in sorted order already.
//        while isSorted(panCakes) == false {
//            if maxVal.ind != 0 {
//                ret.append(maxVal.ind + 1)
//                flip(maxVal.ind, &panCakes, maxVal.val)
//                print("A now: \(panCakes)")
//            }
//            let nextMax = flip(ptr, &panCakes, maxVal.val) // move max value to right
//            print("A now2: \(panCakes)")
//            ret.append(ptr + 1)
//            ptr -= 1
//            print("  next max val: \(nextMax.1), and index: \(nextMax.0); ptr: \(ptr)\n")
//            maxVal = nextMax
//        }
//
//        print(ret)
//        return ret
//    }
//
//    func isSorted(_ panCakes: [Int]) -> Bool {
//        var a = 0, b = panCakes.count - 1
//        var prevVal1 = Int.min, prevVal2 = Int.max
//        print("vittu")
//        while a <= b {
//            print("a: \(panCakes[a]); b: \(panCakes[b]); prevVal: \(prevVal1), \(prevVal2)")
//            if panCakes[a] <= prevVal1 /*|| panCakes[a] > panCakes[b]*/ { return false }
//            if panCakes[b] > prevVal2 { return false }
//            prevVal1 = panCakes[a]
//            prevVal2 = panCakes[b]
//            a += 1; b -= 1
//        }
//        print("joo")
//
//        return true
//    }
//
//    func flip(_ k: Int, _ panCakes: inout [Int], _ maxVal: Int) -> (ind: Int, val: Int) {
//        var a = 0, b = k
//        var maxValInd = (ind: 0, val: 0)
//        while a < b {
//            let maxVal = swapAndReturnMaxIndex(a, b, &panCakes, maxVal)
//            if maxVal.val > maxValInd.val {
//                maxValInd = maxVal
//            }
//            a += 1; b -= 1
//        }
//        return maxValInd
//    }
//
//    func swapAndReturnMaxIndex(_ i: Int, _ j: Int, _ panCakes: inout [Int], _ maxVal: Int) -> (ind: Int, val: Int) {
//        panCakes[j] ^= panCakes[i] <-- BUG IS HERE. We call this method with same i and j; XORing with itself will cause 0.
//        panCakes[i] ^= panCakes[j]
//        panCakes[j] ^= panCakes[i]
//        if panCakes[i] == maxVal { return (j, panCakes[j]) }
//        if panCakes[j] == maxVal { return (i, panCakes[i]) }
//        return panCakes[i] > panCakes[j] ? (i, panCakes[i]) : (j, panCakes[j])
//    }
//}


let i = [3,2,4,1], o = [3, 4, 2, 3, 2] //[4,2,4,3]
let i2 = [1,2,3], o2 = [Int]()
let i4 = [1,3,2], o4 = [2, 3, 2]
let i5 = [1,2,4,3,5], o5 = [5, 5, 3, 4, 3, 2]
let i3 = [3,2,1,4,6,5,7,8,9,13,12,11,14,17,16,15], o3 = [14, 16, 2, 15, 14, 14, 13, 10, 12, 2, 11, 10, 10, 9, 8, 8, 7, 7, 5, 6, 5, 4, 3]
print("Tests started")
let s = Solution()
assert(s.pancakeSort(i) == o)
assert(s.pancakeSort(i2) == o2)
assert(s.pancakeSort(i3) == o3)
assert(s.pancakeSort(i4) == o4)
assert(s.pancakeSort(i5) == o5)
print("Tests Complete!")


/*
 // all integers are unique.
 1 <= A.length <= 100
 1 <= A[i] <= A.length
 */
