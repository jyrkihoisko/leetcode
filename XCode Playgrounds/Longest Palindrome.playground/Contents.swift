class Solution {
    func longestPalindrome(_ s: String) -> Int {
        var ret = 0
        var histo = [Character : Int]()
        for char in s {
            if histo[char] == nil {
                histo[char] = 1
            } else {
                histo[char]! += 1
            }
        }

        var oneException = false // middle letter of palindrome can be odd. e.g. "ddudd"
        for u in histo {
            let mod = u.value % 2
            ret += u.value - mod
            print("adding \(u.value - mod)")
            if oneException == false && mod > 0 {
                ret += 1
                oneException = true
            }
        }
        print(ret)
        return ret
    }
}

let i = "dudasdfasdfasdfasdfdsffrwerwerasfasdfwerasdf", e = 39
let i2 = "dud", e2 = 3

let s = Solution()
assert(s.longestPalindrome(i) == e)
assert(s.longestPalindrome(i2) == e2)
print("tests done!")
