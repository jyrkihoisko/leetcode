import Foundation

class StreamChecker {
    class LetterNode: CustomStringConvertible {
        var letter: Character
        var children: [LetterNode]
        var wordEnd = false
        init(_ l: Character) {
            letter = l
            children = [LetterNode]()
        }
        var description: String { return "\(letter) wordEnd: \(wordEnd): \(children)" }
    }

    var trieRoot: LetterNode
    var queryPointers: [LetterNode?]
    
    init(_ words: [String]) {
        
        trieRoot = LetterNode(Character(" "))
        queryPointers = [LetterNode?]()
        
        for word in words {
            var trieParent = trieRoot
            for char in word {
                var found = false
                print("handling \(char) of \(word)")
                for child in trieParent.children {
                    if child.letter == char {
                        print("  found existing child for \(char)")
                        trieParent = child
                        found = true
                        break
                    }
                }
                if found == false {
                    let ln = LetterNode(char)
                    print("adding \(char) to trieParent: \(trieParent.letter)")
                    trieParent.children.append(ln)
                    trieParent = ln
                }
            }
            print("TrieParent: \(trieParent.letter); setting wordEnd")
            trieParent.wordEnd = true
        }
        print(trieRoot)
        print("Trie root: \(trieRoot); children: \(trieRoot.children)")
    }
    
    func query(_ letter: Character) -> Bool {
        
        // First check if any new queries can be started
        for child in trieRoot.children {
            if letter == child.letter {
                queryPointers.append(trieRoot)
            }
        }

        // Then check all existing queries
        print("active query pointers: \(queryPointers.count)")
        var ret = false
        var queriesToRemove = [Int]()
        for (qi, queryPointer) in queryPointers.enumerated() {
            var found = false
            for (i, child) in queryPointer!.children.enumerated() {
                if child.letter == letter {
                    print(" \(letter) found; updating query Pointer")
                    found = true
                    queryPointers[qi] = child
                    if child.wordEnd == true {
                        print("Found and completed word ending in '\(child.letter)'")
                        ret = true
                    }
                    break
                }
            }
            if found == false { print("removing query"); queriesToRemove.append(qi) }
        }
        queriesToRemove.sort(by: >)
        for qry in queriesToRemove {
            queryPointers.remove(at: qry)
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
