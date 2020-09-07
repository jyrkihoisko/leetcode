import Foundation

class Solution {
    func wordPattern(_ pattern: String, _ str: String) -> Bool {
        var mapChar = [Character : String]()
        var mapWord = [String : Character]()
        let words = str.split(separator: " ")
        if words.count != pattern.count { return false }
        
        for (char, word) in zip(pattern, words) {
            let w = "\(word)"
            if mapChar[char, default: w] != w { return false }
            mapChar[char] = w
            if mapWord[w, default: char] != char { return false }
            mapWord[w] = char
        }
        return true
    }

}


let p1 = "abba", s1 = "dog cat cat dog", o1 = true
let p2 = "abba", s2 = "dog cat cat fish", o2 = false
let p3 = "abba", s3 = "dog dog dog dog", o3 = false
let p4 = "ab", s4 = "dog cat dog cat dog", o4 = false
let p5 = "abbc", s5 = "dog cat cat fish", o5 = true
let p6 = "abbcc", s6 = "dog cat cat fish fish", o6 = true
let p7 = "abbcd", s7 = "dog cat cat fish fish", o7 = false
let p8 = "abab", s8 = "dog cat cat dog", o8 = false

let s = Solution()
print("Tests started!")
assert(s.wordPattern(p1, s1) == o1)
assert(s.wordPattern(p2, s2) == o2)
assert(s.wordPattern(p3, s3) == o3)
assert(s.wordPattern(p4, s4) == o4)
assert(s.wordPattern(p5, s5) == o5)
assert(s.wordPattern(p6, s6) == o6)
assert(s.wordPattern(p7, s7) == o7)
assert(s.wordPattern(p8, s8) == o8)

print("Tests ended!")
