class Solution {
    func partitionLabels(_ S: String) -> [Int] {

        var sections = [[Int]]()
        
        for char in S {
            let c = Int(char.asciiValue!) - 97
            var sectionFound = false
            var sectionIndex = sections.count - 1
            while sectionIndex >= 0 {
                let section = sections[sectionIndex]
                if section[c] != 0 {
                    sectionFound = true
                    sections[sectionIndex][c] += 1
                    break
                }
                sectionIndex -= 1
            }
            if sectionFound {
                print("  existing section found for \(char); index: \(sectionIndex)")
                var j = sections.count - 2
                while j >= sectionIndex  {
                    sections[j] = combineMaps(sections[j], sections.removeLast())//sections[j+1])
                    j -= 1
                    print("perse")
                }
                print("  section count now \(sections.count)")
            } else {
                print("creating new section for \(char)")
                var newSection = Array(repeating: 0, count: 30)
                newSection[c] = 1
                sections.append(newSection)
            }
        }
        print("sections count: \(sections.count)")
        return sections.map { (section) -> Int in
            return section.reduce(0) { (res, a) -> Int in
                return res + a
            }
        }
    }
    
    func combineMaps(_ a: [Int], _ b: [Int]) -> [Int] {
        print("combining \(a) and \(b)")
        var c = [Int]()
        for i in 0..<30 {
            c.append(a[i] + b[i])
        }
        print("vittu")
        return c
    }
}

let s = Solution()
print(s.partitionLabels("aba"))
print("--------")
assert(s.partitionLabels("aba") == [3])
assert(s.partitionLabels("ababcbacadefegdehijhklij") == [9,7,8])
assert(s.partitionLabels("abc") == [1,1,1])
assert(s.partitionLabels("aba") == [3])



print("Tests completed!")
