class Solution {
    var memo = [Int : Int]()
    func mincostTickets(_ days: [Int], _ costs: [Int]) -> Int {

        memo = [Int : Int]()
        
        let ret = recurse(1, 0, days, costs)
        print(ret)
        return ret
    }
    
    func recurse(_ ticketValidity: Int, _ dayIndex: Int, _ days: [Int], _ costs: [Int]) -> Int {
        if memo[ticketValidity*1000 + dayIndex] != nil {
            return memo[ticketValidity*1000 + dayIndex]!
        }
        if dayIndex == days.count {
            return 0 // No need to purchase more tickets
        }
        if ticketValidity > days.last! {
            return 0 // No need to purchase more tickets
        }
        
        var minCost = Int.max
        
        // Skip to the next day when our current ticket is not valid anymore.
        var skipDays = 0
        while ticketValidity > days[dayIndex + skipDays] {
            //print("skipping day \(days[dayIndex + skipDays])")
            skipDays += 1
        }
        let currentNotValidDay = days[dayIndex + skipDays]
        // Purchase 1-day ticket
        minCost = min(minCost, recurse(currentNotValidDay + 1, dayIndex + skipDays, days, costs) + costs[0])
        // Purchase 7-day ticket
        minCost = min(minCost, recurse(currentNotValidDay + 7, dayIndex + skipDays, days, costs) + costs[1])
        // Purchase 30-day ticket
        minCost = min(minCost, recurse(currentNotValidDay + 30, dayIndex + skipDays, days, costs) + costs[2])
        memo[ticketValidity*1000 + dayIndex] = minCost
        return minCost
    }
}



let days1 = [1,4,6,7,8,20], costs1 = [2,7,15], o1 = 11
let days2 = [1,2,3,4,5,6,7,8,9,10,30,31], costs2 = [2,7,15], o2 = 17

let s = Solution()


assert(s.mincostTickets(days1, costs1) == o1)
assert(s.mincostTickets(days2, costs2) == o2)

print("Tests done!")


/*
 1 <= days.length <= 365
 1 <= days[i] <= 365
 days is in strictly increasing order.
 costs.length == 3
 1 <= costs[i] <= 1000
 */
