import Foundation

// TODO:
// While this solution works, it doesn't pass large test sets due to time out.
// The problem author assumes that Trie -structure is used to solve this problem.

//extension String {
//    var length: Int {
//        return count
//    }
//    subscript (i: Int) -> String {
//        return self[i ..< i + 1]
//    }
//    func substring(fromIndex: Int) -> String {
//        return self[min(fromIndex, length) ..< length]
//    }
//    func substring(toIndex: Int) -> String {
//        return self[0 ..< max(0, toIndex)]
//    }
//    subscript (r: Range<Int>) -> String {
//        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
//                                            upper: min(length, max(0, r.upperBound))))
//        let start = index(startIndex, offsetBy: range.lowerBound)
//        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
//        return String(self[start ..< end])
//    }
//}

class StreamChecker {
    
    struct MyWord {
        var wordIndex = 0
        var letterIndex = 0
        var count = 0
    }

    var words = [ContiguousArray<CChar>]()
    var queriedLetters = [Character]()
    var contenderWords = [MyWord]()
    
    init(_ words: [String]) {
        for word in words {
            self.words.append(word.utf8CString)
        }
        queriedLetters = [Character]()
        contenderWords = [MyWord]()
    }
    
    func query(_ letter: Character) -> Bool {
        let l = letter.asciiValue
        var ret = false
        var found = false
        
        // first scan if there are new words that may have started
        for (i, w) in words.enumerated() {
            let char = w.first!
            if UInt8(char) == l {
                contenderWords.append(MyWord(wordIndex: i, letterIndex: 0, count: w.count))
                found = true
            }
        }
        // then scan if there are words that continue
        var wordsToDrop = [Int]()
        for i in 0..<contenderWords.count {
            let word = words[contenderWords[i].wordIndex]
            if contenderWords[i].letterIndex == (word.count - 2) && UInt8(word[contenderWords[i].letterIndex]) == l {//UInt8(word.last!) == l {
                wordsToDrop.append(i)
                found = true
                ret = true
            } else if UInt8(word[contenderWords[i].letterIndex]) != l {
                wordsToDrop.append(i)
            } else {
                contenderWords[i].letterIndex += 1
            }
        }
        wordsToDrop.sort(by: >)

        for i in wordsToDrop {
            contenderWords.remove(at: i)
        }
        
        if found == false {
            queriedLetters.removeAll()
        } else {
            queriedLetters.append(letter)
        }
        
        return ret
    }
}

/**
 * Your StreamChecker object will be instantiated and called as such:
 * let obj = StreamChecker(words)
 * let ret_1: Bool = obj.query(letter)
 */

let i = ["cd", "f", "kl", "cde", "jkllll", "jklmmm", "jkmmm", "jklmm", "jklmmmmm"]
print("started")
let s = StreamChecker(i)
assert(s.query("a") == false)
assert(s.query("b") == false)
assert(s.query("c") == false)
assert(s.query("d") == true)
assert(s.query("e") == true)
assert(s.query("f") == true)
assert(s.query("g") == false)
assert(s.query("h") == false)
assert(s.query("i") == false)
assert(s.query("j") == false)
assert(s.query("k") == false)
assert(s.query("l") == true)
assert(s.query("l") == false)
assert(s.query("l") == false)
assert(s.query("l") == true)

print("ended")

/*
 class StreamChecker {
     
     struct MyWord {
         var wordIndex = 0
         var letterIndex: String.UTF8View.Index
         var count = 0
     }

     var words = [String.UTF8View]()
     var queriedLetters = [Character]()
     var contenderWords = [MyWord]()
     
     init(_ words: [String]) {
         for word in words {
             self.words.append(word.utf8)
         }
         queriedLetters = [Character]()
         contenderWords = [MyWord]()
     }
     
     func query(_ letter: Character) -> Bool {
         print("letter: \(letter)")
         let l = letter.asciiValue
         var ret = false
         var found = false
         
         // first scan if there are new words that may have started
         for (i, w) in words.enumerated() {
             let char = w.first!
             if UInt8(char) == l {
                 print("found the start of \(w)")
                 contenderWords.append(MyWord(wordIndex: i, letterIndex: w.startIndex, count: w.count))
                 found = true
             }
         }
         // then scan if there are words that continue
         var wordsToDrop = [Int]()
         for i in 0..<contenderWords.count {
             print("  evaluating \(letter) against \(words[contenderWords[i].wordIndex])")
             let word = words[contenderWords[i].wordIndex]
             print("word endIndex: \(word.endIndex), letterindex: \(contenderWords[i].letterIndex) ")
             if contenderWords[i].letterIndex == word.index(before: word.endIndex) && word.last! == l {
             //if contenderWords[i].letterIndex == contenderWords[i].count - 1 && word.last! == l {
             ////if word.count == 1 && word.last! == letter {
                 wordsToDrop.append(i)
                 found = true
                 ret = true
                 print("found and completed word: \(word)")
             } else if UInt8(word[contenderWords[i].letterIndex]) != l {
             //} else if Character(word[contenderWords[i].letterIndex]) != l {//word[contenderWords[i].letterIndex] != letter {
                 wordsToDrop.append(i)
             } else {
                 print("  keeping and dropping first letter from \(word)")
                 contenderWords[i].letterIndex = word.index(after: contenderWords[i].letterIndex)
                 //String.UTF8View.formIndex(contenderWords[i].letterIndex)
                 //contenderWords[i].letterIndex  // = contenderWords[i].letterIndex //+= 1 //String(word.dropFirst())
             }
         }
         //let str = "abcdefgh"
         //print(str[4..<5])
         print("Contender words: \(contenderWords)")
         print("Words to Drop: \(wordsToDrop)")
         wordsToDrop.sort(by: >)
         print("Words to Drop: \(wordsToDrop)")

         for i in wordsToDrop {
             contenderWords.remove(at: i)
         }
         
         if found == false {
             queriedLetters.removeAll()
         } else {
             queriedLetters.append(letter)
         }
         
         return ret
     }
 }

 */


/*
WORKS, BUT STILL tOO SLOW
class StreamChecker {
    
    struct MyWord {
        var wordIndex = 0
        var letterIndex = 0
        var count = 0
    }

    var words = [String]()
    var queriedLetters = [Character]()
    var contenderWords = [MyWord]()
    
    init(_ words: [String]) {
        self.words = words
        queriedLetters = [Character]()
        contenderWords = [MyWord]()
    }
    
    func query(_ letter: Character) -> Bool {
        print("letter: \(letter)")
        var ret = false
        var found = false
        
        // first scan if there are new words that may have started
        for (i, w) in words.enumerated() {
            let char = w.first!
            if char == letter {
                print("found the start of \(w)")
                contenderWords.append(MyWord(wordIndex: i, letterIndex: 0, count: w.count))
                found = true
            }
        }
        // then scan if there are words that continue
        var wordsToDrop = [Int]()
        for i in 0..<contenderWords.count {
            print("  evaluating \(letter) against \(words[contenderWords[i].wordIndex])")
            let word = words[contenderWords[i].wordIndex]
            if contenderWords[i].letterIndex == contenderWords[i].count - 1 && word.last! == letter {
            //if word.count == 1 && word.last! == letter {
                wordsToDrop.append(i)
                found = true
                ret = true
                print("found and completed word: \(word)")
            } else if Character(word[contenderWords[i].letterIndex]) != letter {//word[contenderWords[i].letterIndex] != letter {
                wordsToDrop.append(i)
            } else {
                print("  keeping and dropping first letter from \(word)")
                contenderWords[i].letterIndex += 1 //String(word.dropFirst())
            }
        }
        let str = "abcdefgh"
        print(str[4..<5])
        print("Contender words: \(contenderWords)")
        print("Words to Drop: \(wordsToDrop)")
        wordsToDrop.sort(by: >)
        print("Words to Drop: \(wordsToDrop)")

        for i in wordsToDrop {
            contenderWords.remove(at: i)
        }
        
        if found == false {
            queriedLetters.removeAll()
        } else {
            queriedLetters.append(letter)
        }
        
        return ret
    }
}
*/


/*
 WORKS: TOO SLOW
 class StreamChecker {

     var words = [String]()
     var queriedLetters = [Character]()
     var contenderWords = [String]()
     
     init(_ words: [String]) {
         self.words = words
         queriedLetters = [Character]()
         contenderWords = [String]()
     }
     
     func query(_ letter: Character) -> Bool {
         print("letter: \(letter)")
         var ret = false
         var found = false
         
         // first scan if there are new words that may have started
         for word in words {
             let char = word.first!
             if char == letter {
                 contenderWords.append(word)
                 found = true
             }
         }
         
         // then scan if there are words that continue
         var wordsToDrop = [Int]()
         for i in 0..<contenderWords.count {
             print("  evaluating \(letter) againts \(contenderWords[i])")
             let word = contenderWords[i]
             if word.count == 1 && word.last! == letter {
                 wordsToDrop.append(i)
                 found = true
                 ret = true
                 print("found and completed word: \(contenderWords[i])")
             } else if word.first! != letter {
                 wordsToDrop.append(i)
             } else {
                 print("  keeping and dropping first letter from \(word)")
                 contenderWords[i] = String(word.dropFirst())
             }
         }
         print("Contender words: \(contenderWords)")
         print("Words to Drop: \(wordsToDrop)")
         wordsToDrop.sort(by: >)
         print("Words to Drop: \(wordsToDrop)")

         for i in wordsToDrop {
             contenderWords.remove(at: i)
         }
         
         if found == false {
             queriedLetters.removeAll()
         } else {
             queriedLetters.append(letter)
         }
         
         return ret
     }
 }

 */
