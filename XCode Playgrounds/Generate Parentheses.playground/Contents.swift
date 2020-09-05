class Solution {
    // This implementation follows the algorithm suggested in "grokking-the-coding-interview" course in Educative.
    // This is not the fastest solution for this particular problem.
    
    func generateParenthesis(_ n: Int) -> [String] {
        class ParenthesisString {
            var s = "", openCount = 0, closeCount = 0
            init(_ s: String, _ a: Int, _ b: Int) {
                self.s = s; openCount = a; closeCount = b
            }
        }

        var ret = [String]()
        var q = [ParenthesisString]()
        q.append(ParenthesisString("", 0,0))
        
        while !q.isEmpty {
            let subStr = q.removeFirst()

            if subStr.openCount == n && subStr.closeCount == n { ret.append(subStr.s); continue }
            if subStr.openCount == subStr.closeCount {
                subStr.s += "("
                subStr.openCount += 1
                q.append(subStr)
            } else if subStr.openCount > subStr.closeCount {
                let subStr2 = ParenthesisString(subStr.s, subStr.openCount, subStr.closeCount)
                subStr2.s += ")"
                subStr2.closeCount += 1
                if subStr.openCount < n {
                    subStr.s += "("
                    subStr.openCount += 1
                    q.append(subStr)
                }
                q.append(subStr2)
            }
        }
        print(ret)
        return ret
    }
}

let i2 = 2, o2 = ["(())","()()"]
let i = 3, o = [
  "((()))",
  "(()())",
  "(())()",
  "()(())",
  "()()()"
]

let s = Solution()

print("Tests started!")
assert(s.generateParenthesis(i) == o)
assert(s.generateParenthesis(i2) == o2)
assert(s.generateParenthesis(1) == ["()"])

print("Tests ended!")

/*
 Solution from LeetCode that uses recursion; FASTEST solution!
 
 class Solution {
     func generateParenthesis(_ n: Int) -> [String] {
         var result = [String]()
         if n == 0 { return result }
 
         var str = ""
         generateParenthesisUtil(&result,str,n,0,0)
         return result
     }
     
     func generateParenthesisUtil(_ result:inout [String],_ str: String, _ n:Int, _ left:Int, _ right:Int) {
         if right == n {
             result.append(str)
             return
         }
         if (left < n) {
             let s = str + "("
             generateParenthesisUtil(&result,s, n, left + 1, right)
         }
         if(left > right) {
             let s = str + ")"
             generateParenthesisUtil(&result,s, n, left, right + 1)
         }
     }
 }
 */
