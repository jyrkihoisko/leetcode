class Solution {
    func minInsertions(_ s: String) -> Int {

        var errors = 0
        let str = s.utf8CString
        let count = str.count - 1
        var i = 0
        var stack = 0

        while (i < count) {
        
            let char = str[i]
            var nextChar = CChar(45)    // just empty place holder

            if i < count + 1 { nextChar = str[i+1] }
            
            print("analyzing: \(char) at index \(i); errors: \(errors); stack count: \(stack)")
            switch char {
            case 40: // (
                stack += 1
            case 41: // )
                if nextChar == 41 { // ))
                    if stack > 0 {
                        stack -= 1  // take one '(' from stack
                        i += 1      // skip nextChar
                    } else {
                        i += 1      // add one char
                        errors += 1 // and skip nextChar
                    }
                } else if nextChar == 40 { // )(
                    if stack > 0 {
                        stack -= 1  // pop '(' from stack
                        errors += 1 // and add one ')'
                    } else {
                        errors += 2
                    }
                } else { // last char
                    if stack > 0 {
                        stack -= 1 // pop one '(' and add ')' to make ())
                        errors += 1
                    } else {
                        errors += 2
                    }
                }
            default:
            print("unknown case!")
            }
            i += 1
        }
        
        print("errors: \(errors); stack: \(stack); thus total chars to add \(stack*2 + errors)")
        return stack*2 + errors
        
    }
}

let s = Solution()

let input = "(()))", output = 1 // ( )) ( ))
let input2 = "())", output2 = 0
let input3 = "))())(", output3 = 3
let input4 = "((((((", output4 = 12
let input5 = ")))))))", output5 = 5
let input6 = ")())()))()", output6 = 5

assert(s.minInsertions(input) == output)
assert(s.minInsertions(input2) == output2)
assert(s.minInsertions(input3) == output3)
assert(s.minInsertions(input4) == output4)
assert(s.minInsertions(input5) == output5)
assert(s.minInsertions(input6) == output6)
print("tests done")

//For example, "())", "())(())))" and "(())())))" are balanced, ")()", "()))" and "(()))" are not balanced.

/*
 Input: s = "( ()) )"
 Output: 1
 Explanation: The second '(' has two matching '))', but the first '(' has only ')' matching. We need to to add one more ')' at the end of the string to be "(())))" which is balanced.
 */

/*
 Conditions:
 1 <= s.length <= 10^5
 s consists of '(' and ')' only
 */


/*
 INCORRECT ASSUMPTION:
 func minInsertions(_ s: String) -> Int {

     var errors = 0
     let str = s.utf8CString
     let count = str.count - 1
     var i = 0
     
     while (i < count) {
     
         let char = str[i]
         var nextChar = CChar(45)
         
         print(nextChar)
         
         if i < count + 1 { nextChar = str[i+1] }
         
         print("analyzing: \(char) at index \(i);  errors: \(errors)")
         switch char {
         case 40: // (
             if nextChar == 40 { // ((
                 errors += 2 // no skip
             } else if nextChar == 41 {// ()
                 if i < (count - 2) {
                     if str[i+2] == 41 { // ())
                         i += 2
                     }
                 } else {
                     i += 1
                     errors += 1
                 }
             } else { // end of string; no next char
                 errors += 2
             }
         case 41: // )
             if nextChar == 41 { // ))
                 i += 1
                 errors += 1
             } else if nextChar == 40 { // )(
                 errors += 2
             } else { // last char
                 errors += 2
             }
         default:
         print("unknown case!")
         }
         i += 1
         print("  i = \(i) char = \(char); errors: \(errors/2)")
     }
     let errAdd = errors % 2 == 1 ? 2 : 0 // if 1; then we have ")" which needs ( and )
     
     print("errors: \(errors)")
     return errors //stackCounter + errors/2 + errAdd
     
 }

 */



/* TRASHCAN CODE:
 
 func minInsertions(_ s: String) -> Int {
     var ret = 0
     var stack = [Int]()
     let st = s.utf8CString
     let count = st.count - 1
     // 40 = (
     // 41 = )
     var errors = 0
     
     // check number of unbalances
     var ptr = 0
     while ptr < count {
         let c = st[ptr]
         if c == 40 {
             stack.append(1) // 1 = (
         }
         if c == 41 { // )
             if !stack.isEmpty {
                 let d = stack.removeLast()
                 if d != 40 {
                     errors += 1
                 }
             } else {
                 errors += 1
             }
             if !stack.isEmpty {
                 let e = stack.removeLast()
                 if e != 40 {
                     errors += 1
                 }
             } else { errors += 1}
         }
         ptr += 1
     }
     
     return ret
     
 }

 */


