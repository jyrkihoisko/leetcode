class Solution {
    func getHint(_ secret: String, _ guess: String) -> String {
        var bulls = 0
        var bullsCows = 0
        let s = Array(secret)
        let g = Array(guess)
        var histogram = [Character : Int]()
        
        // Calculate histogram
        for i in 0..<s.count {
            histogram[s[i], default: 0] += 1
        }
        
        for i in 0..<g.count {
            // first check if guess char exists; it is either bull or cow.
            if histogram[g[i], default: 0] > 0 {
                bullsCows += 1
                histogram[g[i], default: 1] -= 1
            }
            if g[i] == s[i] {
                bulls += 1
            }
        }
        return "\(bulls)A\(bullsCows-bulls)B"
    }
}


print("Tests started!")

let s = Solution()

assert(s.getHint("1807", "7810") == "1A3B")
assert(s.getHint("1123", "0111") == "1A1B")
assert(s.getHint("1111", "1111") == "4A0B")
assert(s.getHint("1111", "0000") == "0A0B")
assert(s.getHint("1111", "0101") == "2A0B")
assert(s.getHint("1234", "4321") == "0A4B")
assert(s.getHint("1122", "1222") == "3A0B")
assert(s.getHint("1122", "1221") == "2A2B")

assert(s.getHint("1122", "0001") == "0A1B")

print("Tests ended!")
