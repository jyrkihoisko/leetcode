class Solution {
    func getHint(_ secret: String, _ guess: String) -> String {
        var bulls = 0
        var cows = 0
        var histogram = [Character : Int]()
        for schar in secret {
            histogram[schar, default: 0] += 1
        }

        // first-pass for bulls
        for (gi, gchar) in guess.enumerated() {
            for (si, schar) in secret.enumerated() {
                if schar == gchar && si == gi {
                    bulls += 1
                    histogram[gchar]! -= 1
                    break
                }
            }
        }
        // second-pass for cows
        here: for (gi, gchar) in guess.enumerated() {
            // in the absence of subscript in String in swift, we have to do this stupid thing.
            for (si, schar) in secret.enumerated() {
                if schar == gchar && si == gi {
                    continue here
                }
            }

            // second-pass for cows
            for (si, schar) in secret.enumerated() {
                if schar == gchar && histogram[gchar, default: 0] > 0 {
                    print("g: \(gchar), in gi: \(gi); si: \(si), histo: \(histogram)")
                    cows += 1
                    histogram[gchar]! -= 1
                    continue here
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
