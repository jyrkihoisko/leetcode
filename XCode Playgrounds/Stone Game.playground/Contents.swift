class Solution {

    var memoLee = [Int : Int]()
    var memoAlex = [Int : Int]()

        func stoneGame(_ piles: [Int]) -> Bool {
            guard piles.count > 2 else { return true }
            guard piles.count % 2 == 0 else { print("INVALID PILES"); return true }
            memoLee = [Int:Int]()
            memoAlex = [Int:Int]()
            
            let maxLeft = recurse(0, piles, 1, piles.count-1, 1)
            let maxRight = recurse(piles.count - 1, piles, 0, piles.count - 2, 1)
            
            print("selecting \(piles[0]) results in \(maxLeft-piles.last!); selecting \(piles.last!) results in \(maxRight-piles.first!)")
            return max(maxLeft-piles.last!, maxRight-piles.first!) > 0 ? true : false
        }
        
        func recurse(_ i: Int, _ piles: [Int], _ left: Int, _ right: Int, _ round: Int) -> Int {
            //print("currently selected pile: \(i) val: \(piles[i]) this is \(round == -1 ? "Lee's" : "Alex's") turn")
            if right-left == 1 {
                print("  only two piles left: \(piles[left]), and \(piles[right]), alex's turn")
                return max(piles[left]-piles[right], piles[right]-piles[left]) // Alex's turn; always positive
            }
            
            if round == -1 {
                if memoLee[left * 500 + right] != nil {
                    print("using memo for LEE!")
                    return memoLee[left * 500 + right]!
                }
            } else {
                if memoAlex[left * 500 + right] != nil {
                    print("using memo for ALEX!!!")
                    return memoAlex[left * 500 + right]!
                }
            }
            // select left or max
            let resultLeft = recurse(left, piles, left + 1, right, (round * -1))
            let resultRight = recurse(right, piles, left, right - 1, (round * -1))
            
            memoLee[left * 500 + right] = min(resultLeft, resultRight) + round*piles[i]
            memoAlex[left * 500 + right] = max(resultLeft, resultRight) + round*piles[i]
            
            if round == -1 {
                // Lee's turn; select pile that minimizes alex's points
                //print("after considering i: \(i) (\(piles[i]), returning: \(min(resultLeft, resultRight) + round*piles[i]) ;this is Lee's turn")
                return min(resultLeft, resultRight) + round*piles[i]
            } else {
                //print("after considering i: \(i) (\(piles[i]), returning: \(max(resultLeft, resultRight) + round*piles[i]) ;this is Alex's turn")
                return max(resultLeft, resultRight) + round*piles[i]
            }
        }
    }

let s = Solution()

let i = [5,3,4,5], o = true
let i2 = [5,3,5,7,4,5], o2 = true
let i3 = [1,2,3,2,2,1], o3 = true
let i4 = [1,2,3,4,5,3,4,2,3,5,4,6,7,5,6,4,5,2,2,4,5,5,5,5,5,4,4,2,2,1,1,3,3,4,4,5,6,4,5,6,6,7,7,8,8,9,9,3,3,4,4,5,5,6,6,7,7,2,2,1], o4 = true

assert(s.stoneGame(i) == o)
assert(s.stoneGame(i2) == o2)
assert(s.stoneGame(i3) == o3)
assert(s.stoneGame(i4) == o4)

print("Tests done!")
/*
 2 <= piles.length <= 500
 piles.length is even.
 1 <= piles[i] <= 500
 sum(piles) is odd.
 */


