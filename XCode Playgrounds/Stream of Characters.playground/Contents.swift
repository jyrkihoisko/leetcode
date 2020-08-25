import Foundation

class StreamChecker {
    class TrieNode: CustomStringConvertible {
        var letter: Character
        var children: [Character : TrieNode]
        var wordEnd = false
        init(_ l: Character) {
            letter = l
            children = [Character : TrieNode]()
        }
        var description: String { return "\(letter) wordEnd: \(wordEnd): \(children)" }
    }

    var trieRoot: TrieNode
    var streamBuffer: [Character]
    var maxWordLength = 0
    
    init(_ words: [String]) {
        trieRoot = TrieNode(Character(" "))
        for word in words {
            var trieParent = trieRoot
            maxWordLength = max(maxWordLength, word.count)
            for char in word.reversed() {
                print("handling \(char) of \(word)")
                if let child = trieParent.children[char] {
                    print("  found existing child for \(char)")
                    trieParent = child
                } else {
                    let ln = TrieNode(char)
                    print("adding \(char) to trieParent: \(trieParent.letter)")
                    trieParent.children[char] = ln
                    trieParent = ln
                }
            }
            print("TrieParent: \(trieParent.letter); setting wordEnd")
            trieParent.wordEnd = true
        }
        streamBuffer = [Character]()
        streamBuffer.reserveCapacity(maxWordLength)
    }
    
    func query(_ letter: Character) -> Bool {
        streamBuffer.append(letter)
        if streamBuffer.count == maxWordLength + 1 {
            streamBuffer.removeFirst() // ensure we have a deterministic buffer size.
        }
        var ptr = trieRoot
        
        for char in streamBuffer.reversed() {
            if let child = ptr.children[char] {
                ptr = child
                if child.wordEnd { return true }
            } else {
                return false
            }
        }
        return false
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
