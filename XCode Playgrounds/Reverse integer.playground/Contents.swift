class Solution {
    func reverse(_ x: Int) -> Int {
        var n = x
        var ret = 0

        while n != 0 {
            ret += n % 10
            n /= 10
            if n != 0 { ret *= 10 }
            if ret > 2147483647 || ret < -2147483648 { return 0 } // overflowing!
        }
        return ret
    }
}
