import Foundation

class Solution {
    func reorderLogFiles(_ logs: [String]) -> [String] {
        var letterLogs = [String]()
        var digitLogs = [String]()
        
        for log in logs {
            let array = log.components(separatedBy: " ")
            let firstChar = array[1].first!
            if firstChar >= "0" && firstChar <= "9" {
                digitLogs.append(log)
            } else {
                letterLogs.append(log)
            }
        }
        letterLogs.sort { (a, b) -> Bool in
            let k = a.components(separatedBy: " ")
            let j = b.components(separatedBy: " ")
            var a = ""
            var b = ""
            for i in 1..<k.count {
                a += k[i]
                if i < k.count-1 { a += " " }
            }
            for i in 1..<j.count {
                b += j[i]
                if i < j.count-1 { b += " " }
            }

            if a < b { return true }
            if a == b { return k[0] < j[0] ? true : false } // If strings equal, then use the key to determine order
            return false
        }
        print(letterLogs + digitLogs)
        return letterLogs + digitLogs
    }
}

let s = Solution()
let i = ["dig1 8 1 5 1","let1 art can","dig2 3 6","let2 own kit dig","let3 art zero"], o = ["let1 art can","let3 art zero","let2 own kit dig","dig1 8 1 5 1","dig2 3 6"]

let i2 = ["a1 9 2 3 1","g1 act car","zo4 4 7","ab1 off key dog","a8 act zoo"]
let o2 = ["g1 act car","a8 act zoo","ab1 off key dog","a1 9 2 3 1","zo4 4 7"]

let i3 = ["j mo", "5 m w", "g 07", "o 2 0", "t q h"], o3 = ["5 m w","j mo","t q h","g 07","o 2 0"]

assert(s.reorderLogFiles(i) == o)
assert(s.reorderLogFiles(i2) == o2)
assert(s.reorderLogFiles(i3) == o3)
print("Tests Done!")


/*
 0 <= logs.length <= 100
 3 <= logs[i].length <= 100
 logs[i] is guaranteed to have an identifier, and a word after the identifier.
 */
