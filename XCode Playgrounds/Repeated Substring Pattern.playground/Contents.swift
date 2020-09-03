class Solution {
    func repeatedSubstringPattern(_ s: String) -> Bool {
        guard s.count > 1 else { return false }

        let str = s.utf8CString
        var strPtr = 1
        
        while strPtr <= (str.count - 1)/2 {
            var testingPtr = strPtr // start testing AFTER substring
            var substrPtr = 0, isCriteriaMet = true
            var count = 1

            while testingPtr < str.count-1 {
                if str[substrPtr] != str[testingPtr] {
                    isCriteriaMet = false
                    break
                }
                substrPtr += 1
                testingPtr += 1
                if substrPtr == strPtr { substrPtr = 0; count += 1 } // One match
            }
            if isCriteriaMet == true, count > 1, substrPtr == 0 { return true }
            strPtr += 1 // increase size of multiplier/substring for next round
        }
        
        return false
    }
}

/*
 Simplest Solution from LeetCode: (slow ~3.0sec compared to above that takes 604ms)
 func repeatedSubstringPattern(_ s: String) -> Bool {
     var newstr = s + s
     newstr.removeLast()
     newstr.removeFirst()
     return newstr.contains(s) ? true : false
 }
 */
/*
 Fastest solution (50% faster than my solution)
 class Solution {
     func repeatedSubstringPattern(_ s: String) -> Bool {
         let s = Array(s)
         outerLoop: for count in 1..<s.count where s.count / count > 1 && s.count % count == 0 {
             let ref = s[0..<count]
             var i = count
             while i + count <= s.count {
                 let current = s[i..<i+count]
                 if current != ref {
                     continue outerLoop
                 }
                 i += count
             }
             return true
         }
         return false
     }
 }
 */


let s = Solution()
assert(s.repeatedSubstringPattern("abab") == true)
assert(s.repeatedSubstringPattern("aba") == false)
assert(s.repeatedSubstringPattern("abcabcabcabc") == true)
assert(s.repeatedSubstringPattern("perseenvarinenkyrpaperseenvarinenkyrpaperseenvarinenkyrpa") == true)
assert(s.repeatedSubstringPattern("aaa") == true)
assert(s.repeatedSubstringPattern("aba") == false)
assert(s.repeatedSubstringPattern("aa") == true)
assert(s.repeatedSubstringPattern("aabaaba") == false)


print("Tests Done!")
