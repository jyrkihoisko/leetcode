class Solution {

    func validPalindrome(_ s: String) -> Bool {
        if s.count <= 0 { return false }
        return checkPalindromiality(0, s.utf8CString.count - 2, s.utf8CString, false)
    }

    func checkPalindromiality(_ left: Int, _ right: Int, _ s: ContiguousArray<CChar>, _ isReplacementUsed: Bool) -> Bool {
        if s[left] != s[right] {
            if isReplacementUsed { return false }
            // Try removing from left, and right; notice we have already used "one replacement"
            return checkPalindromiality(left + 1, right, s, true) || checkPalindromiality(left, right - 1, s, true)
        }
        if left >= right { return true }
        return checkPalindromiality(left + 1, right - 1, s, isReplacementUsed)
    }
}

let s = Solution()
assert(s.validPalindrome("") == false)
assert(s.validPalindrome("aba") == true)
assert(s.validPalindrome("abcbdbba") == true)
assert(s.validPalindrome("abcbddbba") == true)
assert(s.validPalindrome("abcbdrba") == false)
assert(s.validPalindrome("ABBA") == true)
assert(s.validPalindrome("dABBA") == true)
assert(s.validPalindrome("dABzBA") == true)
assert(s.validPalindrome("abc") == false)
assert(s.validPalindrome("") == false)
assert(s.validPalindrome("a") == true)
assert(s.validPalindrome("lcupuupucul") == true)

assert(s.validPalindrome("aguokepatgbnvfqmgmlcupuufxoohdfpgjdmysgvhmvffcnqxjjxqncffvmhvgsymdjgpfdhooxfuupuculmgmqfvnbgtapekouga") == true)



print("Tests done!")
