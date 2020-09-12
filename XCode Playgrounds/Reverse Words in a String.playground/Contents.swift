//import Foundation // <-- needed for trimmingCharacters()
class Solution {
    func reverseWords(_ s: String) -> String {
        return s.split(separator: " ").reversed().joined(separator: " ")
// First version
//        var ret = ""
//        for word in s.split(separator: " ").reversed() {
//            //ret += word.trimmingCharacters(in: [" "]) + " "
//            ret += word + " "
//        }
//        if ret.count > 0 { ret.removeLast() }
//        return ret
    }
}

print("Tests started!")
let s = Solution()
assert(s.reverseWords("the sky is blue") == "blue is sky the")
assert(s.reverseWords("a good    example") == "example good a")
assert(s.reverseWords("a good    example") == "example good a")
assert(s.reverseWords("  ") == "")
assert(s.reverseWords("abbas   ") == "abbas")
assert(s.reverseWords("   abbas   ") == "abbas")
assert(s.reverseWords("   abbas") == "abbas")
assert(s.reverseWords("abbas! a   b S  !   ") == "! S b a abbas!")

print("Tests ended!")
