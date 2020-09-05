class Solution {
    // This implementation follows the algorithm suggested in "grokking-the-coding-interview" course in Educative.
    // This is not the fastest solution for this particular problem.
    
    func generateParenthesis(_ n: Int) -> [String] {
        var ret = [String]()
        helper(n, 0, 0, "",  &ret)
        print(ret)
        return ret
    }
    
    func helper(_ n: Int, _ openCount: Int, _ closeCount: Int, _ str: String, _ ret: inout [String]) {
        //if openCount == n && closeCount == n {
        if str.count == 2 * n {
            ret.append(str)
            return
        }
        if openCount < n {
            helper(n, openCount + 1, closeCount, str + "(", &ret)
        }
        if closeCount < openCount {
            helper(n, openCount , closeCount + 1, str + ")", &ret)
        }
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
