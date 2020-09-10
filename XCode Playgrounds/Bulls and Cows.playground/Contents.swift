class Solution {
    func getHint(_ secret: String, _ guess: String) -> String {
        print("----------")
        var bulls = 0
        var cows = 0
        let s = secret.utf8CString
        let g = guess.utf8CString
        
        var histogram = [CChar : Int]()
        for i in 0..<s.count - 1 {
            histogram[s[i], default: 0] += 1
        }
        
        // first-pass check all bulls
        for i in 0..<g.count - 1 {
            // first check if guess char exists
            print("histogram: \(histogram), g[i]: \(g[i])")
            if histogram[g[i], default: 0] == 0 { continue } // jump to next guess char
            
            if g[i] == s[i] {
                print("bull found at i: \(i); \(g[i])")
                bulls += 1
                histogram[g[i], default: 1] -= 1
                continue // step to next guess char
            }
        }
        
        // second-pass check cows
        for i in 0..<g.count - 1 {
            // first check if guess char exists
            if histogram[g[i], default: 0] == 0 { continue } // jump to next guess char
            
            // first check if this was bull scenario, skip it
            if g[i] == s[i] { continue } // step to next guess char

            // otherwise check where the cow is.
            for j in 0..<s.count - 1 {
                if g[i] == s[j] {
                    cows += 1
                    histogram[g[i], default: 1] -= 1
                    break // cow found, continue next guess char
                }
            }
            
        }

        print("\(bulls)A\(cows)B")
        return "\(bulls)A\(cows)B"
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
