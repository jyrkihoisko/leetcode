class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        guard digits.count > 0 else { return [String]() }
        let map: [Character: [Character]] = ["2": ["a", "b", "c"], "3": ["d", "e", "f"], "4": ["g", "h", "i"], "5": ["j", "k", "l"],
                   "6": ["m", "n", "o"], "7": ["p", "q", "r", "s"], "8": ["t", "u", "v"], "9": ["w", "x", "y", "z"]]
        
        var ret: [String] = [""]
        for digit in digits {
            if digit == "1" || digit == "0" { continue }
            var tmp = [String]()
            let letters = map[digit]!
            for str in ret {
                for letter in letters {
                    tmp.append("\(str)\(letter)")
                }
            }
            ret = tmp
        }
        return ret
    }
}
//[] + "a", "b", "c"
// take each above element, and add first letter; take each above element, add second letter
let i = "23", o = ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"]
let i2 = "231", o2 = ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"]
let i3 = "1231", o3 = ["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"]
let i4 = "234", o4 = ["adg", "adh", "adi", "aeg", "aeh", "aei", "afg", "afh", "afi", "bdg", "bdh", "bdi", "beg", "beh", "bei", "bfg", "bfh", "bfi", "cdg", "cdh", "cdi", "ceg", "ceh", "cei", "cfg", "cfh", "cfi"]
let i5 = "5984"

let s = Solution()

assert(s.letterCombinations(i) == o)
assert(s.letterCombinations(i2) == o2)
assert(s.letterCombinations(i3) == o3)
assert(s.letterCombinations(i4) == o4)
print(s.letterCombinations(i5))

print("Tests done!")
