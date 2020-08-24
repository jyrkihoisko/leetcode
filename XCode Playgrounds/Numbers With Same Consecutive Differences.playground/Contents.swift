import Foundation

// TODO:
// Reverse the recursion order; in other words form the number at the node and store it in global variable,
// instead of propagating it to parent (which then shifts the number accordingly). While traditional Recursion
// method works (you propagate partial result to parent which then combines results from children and propagates up),
// it is unnecessarily complex.

class Solution {
    func numsSameConsecDiff(_ N: Int, _ K: Int) -> [Int] {
        var ret = [Int]()
        var tmp = [Int]()

        if N == 1 {
            return [0,1,2,3,4,5,6,7,8,9]
        }
        for i in 1...9 {
            print("recursing with \(i)")
            tmp = recurse(N-1, i, K)
            print("temp: \(tmp)")
            if !tmp.isEmpty {
                for l in 0..<tmp.count {
                    var val = i
                    for _ in 1..<N {
                        val = val * 10
                    }
                    tmp[l] = tmp[l] + val
                }
                print("temp now \(tmp)")
                ret += tmp
            }
        }
        print("ANSWER:")
        print(ret.sorted())
        return ret.sorted()
    }
    
    func recurse(_ n: Int, _ prevVal: Int, _ k: Int) -> [Int] {
        assert(prevVal >= 0 && prevVal <= 9)
        if n == 1 {
            if k == 0 { return [prevVal] }
            var ret = [Int]()
            print("  n = 1, prevVal: \(prevVal), k: \(k)")
            if prevVal + k <= 9 {
                ret.append(prevVal + k)
            }
            if prevVal - k >= 0 {
                ret.append(prevVal - k)
            }
            print("  returning \(ret)")
            return ret
        }
        var ret = [Int]()
        var ar1 = [Int]()
        var ar2 = [Int]()
        
        if (prevVal + k) <= 9 {
            print("\(prevVal) + \(k) <= 9: recursing... n=\(n)")
            ret.append(prevVal + k)
            ar1 = recurse(n-1, prevVal + k, k)
            for i in 0..<ar1.count {
                var val = (prevVal + k)
                for _ in 1..<n {
                    val = val * 10
                }
                ar1[i] = ar1[i] + val
                print("  AR1 now: \(ar1); prevVal: \(prevVal), k: \(k); n: \(n); added: \(prevVal + k)")
            }
        }
        if (prevVal - k) >= 0 && k > 0 {
            print("\(prevVal) - \(k) >= 0: recursing... n=\(n)")
            ret.append(prevVal - k)
            ar2 = recurse(n-1, prevVal - k, k)
            print("ar2 after recurse: n:\(n): \(ar2)")
            for i in 0..<ar2.count {
                var val = (prevVal - k)
                for _ in 1..<n {
                    val = val * 10
                }
                ar2[i] = ar2[i] + val
                print("  AR2 now: \(ar2); prevVal: \(prevVal), k: \(k); n: \(n); added \(prevVal - k)")
            }
        }
        return ar1 + ar2
    }
    
}

let N = 3, K = 7, O = [181,292,707,818,929]
let N2 = 2, K2 = 1, O2 = [10,12,21,23,32,34,43,45,54,56,65,67,76,78,87,89,98]

let N3 = 1, K3 = 1, O3 = [1,2,3,4,5,6,7,8,9]
let N5 = 4, K5 = 7, O5 = [1818, 2929, 7070, 8181, 9292]
let N6 = 3, K6 = 1, O6 = [101,121,212,232,323,343,434,454,545,565,656,676,767,787,878,898,989]
let N7 = 3, K7 = 0, O7 = [111,222,333,444,555,666,777,888,999]

let s = Solution()
print("started!")
assert(s.numsSameConsecDiff(N, K) == O)
assert(s.numsSameConsecDiff(N2, K2) == O2)
//
//assert(s.numsSameConsecDiff(N3, K3) == O3)
//////assert(s.numsSameConsecDiff(N4, K4) == O4)
assert(s.numsSameConsecDiff(N5, K5) == O5)
//assert(s.numsSameConsecDiff(N6, K6) == O6)
assert(s.numsSameConsecDiff(N7, K7) == O7)
//assert(s.numsSameConsecDiff(N6, K6) == O6)


print("Tests done!")
/*
 1 <= N <= 9
 0 <= K <= 9
 */




/*
 TRASHCAN: Naiive attempt without realizing this problem requires Dynamic Programming approach.
 
 
     var l = 1, i = 1
     var num = 1
     var j = 1
     var expectedNumbers = 0
     var processedNumbers = 0
     var minusProcessed = false
     var plusProcessed = false

     while true {
         print("l now \(l)")
         l = j
         //if expectedNumbers == 0 { l = j } // move to next prime digit
         var prevDigit = Int.min
         i = 1
         var numProcessed = true
         
         if processedNumbers <= 0 && l - K >= 0 && l + K < 10 {
             // we can expect two numbers for this digit
             print("expecting two numbers")
             expectedNumbers = 2
             minusProcessed = false
             plusProcessed = false
         } else if processedNumbers <= 0 {
             minusProcessed = false
             plusProcessed = false
             expectedNumbers = 1
         }
         
         while i <= N { // create the correct length of digits
             print("  processing digit: \(i); expectedNumbers = \(expectedNumbers)")
             if i == 1 { num = j }
             else if ((expectedNumbers == 2 && minusProcessed == false) || expectedNumbers == 1) && (l - K >= 0) { // 101 -> 121, -> 212, 232
                 //l -= K
                 num += (l - K)
                 if expectedNumbers == 1 {
                     l -= K
                 }
                 minusProcessed = true
                 //l
                 print("     num now \(num)   2. l: \(l)")
             } else if ((expectedNumbers == 2 && plusProcessed == false) || expectedNumbers == 1) && (l + K < 10) {
                 plusProcessed = true
                 num += l + K
                 if expectedNumbers == 1 {
                     l += K
                 }
                 print("     num now \(num)   1. l: \(l)")
             } else {
                 print("can't continue with this digit: \(l)")
                 j += 1
                 expectedNumbers = 0
                 numProcessed = false
                 break
             }
             prevDigit = l
             i += 1                  // move to next digit
             if i <= N { print("shifting; i=\(i)"); num *= 10 }  // and shift left if we still can
         }
         print("    Processed num: \(num)")
         if numProcessed {
             processedNumbers += 1
             ret.append(num)
             if processedNumbers >= expectedNumbers {
                 print("all expected numbers processed!")
                 j+=1 // move to next prime digit
                 processedNumbers = 0
             }
         }
         if j == 10 { break }
     }
     print(ret)
     return ret
 }

 */
