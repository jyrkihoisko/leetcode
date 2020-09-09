class Solution {
    func compareVersion(_ version1: String, _ version2: String) -> Int {
        let levels1 = version1.split(separator: ".")
        let levels2 = version2.split(separator: ".")
        var ptr = 0
        let c1 = levels1.count
        let c2 = levels2.count
        
        while true {
            let lv1 = ptr < c1 ? (Int(levels1[ptr]) ?? 0) : 0
            let lv2 = ptr < c2 ? (Int(levels2[ptr]) ?? 0) : 0
            if ptr >= c1 && ptr >= c2 { return 0 }
            if lv1 > lv2 { return 1 }
            if lv1 < lv2 { return -1 }
            ptr += 1
        }
    }
}


let s = Solution()
let i1 = "19.8.3.17.5.01.0.0.4.0.0.0.0.0.0.0.0.0.0.0.0.0.00.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.000000.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.000000"
let i2 =
"19.8.3.17.5.01.0.0.4.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0000.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.000000"

print("tests started!")
assert(s.compareVersion("0.1", "1.1") == -1)
assert(s.compareVersion("1.0.1", "1") == 1)
assert(s.compareVersion("7.5.2.4", "7.5.3") == -1)
assert(s.compareVersion("1.01", "1.0001") == 0)
assert(s.compareVersion("1.0", "1.0.0") == 0)
assert(s.compareVersion("1.0", "0") == 1)
assert(s.compareVersion("1.0", "2.abcd") == -1)
assert(s.compareVersion("", "2.abcd") == -1)
assert(s.compareVersion("000.000.001", "000.000.000.01") == 1)
assert(s.compareVersion(i1, i2) == 0)
assert(s.compareVersion("", "") == 0)



print("tests done!")

