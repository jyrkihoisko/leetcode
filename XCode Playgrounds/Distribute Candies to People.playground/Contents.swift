import Foundation

class Solution {
    func distributeCandies(_ candies: Int, _ num_people: Int) -> [Int] {
        var distribution = Array(repeating: 0, count: num_people)
        var given = 0
        var candyCount = 1
        while given < candies {
            //print("given now \(given) of \(candies) total candies")
            for i in 0..<distribution.count {
                //print("Candy count: \(candyCount); given: \(given);")
                if (candyCount + given) >= candies {
                    distribution[i] += candies - given
                    given = candies
                    print(" done")
                    break
                }
                distribution[i] += candyCount
                given += candyCount
                candyCount += 1
            }
        }
        print(distribution)
        return distribution
    }
}

let candies = 7, num_people = 4, o = [1,2,3,1]
let candies2 = 10, num_people2 = 3, o2 = [5,2,3]
let candies3 = 3, num_people3 = 5, o3 = [1,2,0,0,0]
let candies4 = 7, num_people4 = 3, o4 = [2,2,3]
let candies5 = 0, num_people5 = 5, o5 = [0,0,0,0,0]
let candies6 = 100, num_people6 = 1, o6 = [100]
let candies7 = 1000000000, num_people7 = 10, o7 = [100014472, 99980504, 99984976, 99989448, 99993920, 99998392, 100002864, 100007336, 100011808, 100016280]

let s = Solution()
print("Starting...")
assert(s.distributeCandies(candies, num_people) == o)
assert(s.distributeCandies(candies2, num_people2) == o2)
assert(s.distributeCandies(candies3, num_people3) == o3)
assert(s.distributeCandies(candies4, num_people4) == o4)
assert(s.distributeCandies(candies5, num_people5) == o5)
assert(s.distributeCandies(candies6, num_people6) == o6)
assert(s.distributeCandies(candies7, num_people7) == o7)


print("Tests done!")

/*
 1 <= candies <= 10^9
 1 <= num_people <= 1000
 */

