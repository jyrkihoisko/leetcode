class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var anagrams = [String: [String]]()
        for str in strs {
            anagrams[String(str.sorted()), default: []].append(str)
        }
        return Array(anagrams.values)
    }
}

print("Tests started")
let s = Solution()
assert(s.groupAnagrams(["eat","tea","tan","ate","nat","bat"]) == [["eat", "tea", "ate"], ["tan", "nat"], ["bat"]])//[["bat"],["nat","tan"],["ate","eat","tea"]])

print("TEST2")
assert(s.groupAnagrams([""]) == [[""]])

print("TEST3")
assert(s.groupAnagrams([""]) == [[""]])

assert(s.groupAnagrams(["a"]) == [["a"]])

print("Tests ended")
