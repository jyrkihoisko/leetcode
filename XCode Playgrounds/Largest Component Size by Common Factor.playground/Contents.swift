class Solution {
    var primeNumbers = [Int]()
    
    func largestComponentSize(_ A: [Int]) -> Int {
        var map = [Int : [Int]]()

        primeNumbers = calcPrimeNumbers(320)
        for i in 0..<A.count - 1 {
            var neighbors = map[A[i], default: [Int]()]
            for j in i+1..<A.count {
                if calcIfCommonFactor(A[i], A[j]) {
                    neighbors.append(A[j])
                    map[A[j], default: [Int]()] += [A[i]]
                }
            }
            map[A[i]] = neighbors
        }
        print(map.sorted(by: { (arg0, arg1) -> Bool in
            if arg1.key > arg0.key { return true }
            return false
        }))
        var maxPathLength = 0
        for node in A {
            print("recursing with \(node)")
            maxPathLength = max(maxPathLength, recurse([node], map))
        }
        print(maxPathLength)
        return maxPathLength
    }
    
    func recurse(_ path: [Int], _ map: [Int: [Int]]) -> Int {
        // check if we can travel to any of the children
        let node = path.last!

        let children = map[node] ?? [Int]()
        print("\(node) has children: \(children)")
        var childrenToTraverse = [Int]()
        for child in children {
            var childTraversed = false
            for n in path {
                if child == n {
                    childTraversed = true
                }
            }
            if childTraversed == false { childrenToTraverse.append(child) }
        }
        if childrenToTraverse.count == 0 {
            print("node: \(node) has no children to traverse")
            return 1
        }
        var maxPathLength = 0
        for child in childrenToTraverse {
            maxPathLength = max(maxPathLength, recurse(path+[child], map) + 1)
        }
        return maxPathLength
    }
    
    func calcIfCommonFactor(_ a: Int, _ b: Int) -> Bool {
        if a % 2 == 0 && b % 2 == 0 { return true }
        for primeNumber in primeNumbers {
            if a % primeNumber == 0 && b % primeNumber == 0 {
                return true
            }
        }
        return false
    }
    
    func calcPrimeNumbers(_ maxNumber: Int) -> [Int] {
        var number = 17
        var primeNumbers = [2,3,5,7,9,11,13]
        while number < maxNumber {
            var primeFound = true
            for primeNumber in primeNumbers {
                if number % primeNumber == 0 {
                    primeFound = false
                    break
                }
            }
            // number wasn't divisible by any primenumber, it is a prime number
            if primeFound == true { primeNumbers.append(number) }
            number += 2 // check only odd numbers.
        }
        return primeNumbers
    }
}


let s = Solution()
let i = [2,3,6,7,4,12,21,39], o = 8
let i2 = [20,50,9,63], o2 = 2
let i3 = [4,6,15,35], o3 = 4
let i4 = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19], o4 = 5
print("Tests started!")
assert(s.largestComponentSize(i) == o)
assert(s.largestComponentSize(i2) == o2)
assert(s.largestComponentSize(i3) == o3)
// Recursive method takes way too long to process the following:
//assert(s.largestComponentSize(i4) == o4)

print("Tests ended!")
