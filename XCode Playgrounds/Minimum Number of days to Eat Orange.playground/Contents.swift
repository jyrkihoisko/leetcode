class Solution {
        
    func minDays(_ n: Int) -> Int {
        // Use Bottom-up / iterative DP approach using BFS
        //
        // Three options each day:
        // 1. eat 1 orange
        // 2. if remaining oranges divisible by 2, then eat n/2
        // 3. if remaining oranges divibisble by 3, then eat 2 * n / 3

        var dp = [Int: Int]()

        dp[n] = 0

        var q = [n]
        
        while !q.isEmpty {
            let orangesLeft = q.removeFirst()
            print("q value: \(orangesLeft)")

            let days = dp[orangesLeft]!
            if orangesLeft == 0 { print("Eating Days: \(days); DP count: \(dp.count)"); return days }
            if orangesLeft % 3 == 0 {
                if dp[orangesLeft * 1/3] == nil {
                    dp[orangesLeft * 1/3] = days + 1
                    q.append(orangesLeft * 1/3)
                } // otherwise abandon this branch; there's already more optimal traversal ongoing.
            }
            if orangesLeft % 2 == 0 {
                if dp[orangesLeft / 2] == nil {
                    dp[orangesLeft / 2] = days + 1
                    q.append(orangesLeft/2)
                } // otherwise abandon this branch; there's already more optimal traversal ongoing.
            }
            if dp[orangesLeft - 1] == nil {
                dp[orangesLeft - 1] = days + 1
                q.append(orangesLeft - 1)
            } // otherwise abandon this branch; there's already more optimal traversal ongoing.
        }
        print("Error!")
        return -1
    }
}


let s = Solution()
let i = 10, o = 4
let i2 = 6, o2 = 3
let i3 = 1, o3 = 1
let i4 = 56, o4 = 6
let i5 = 1000, o5 = 10
let i6 = 9999, o6 = 14
let i7 = 69652, o7 = 19
let i8 = 123456789, o8 = 28 //123M
let i9 = 1234567890, o9 = 29 //1,2B
assert(s.minDays(i) == o)
assert(s.minDays(i2) == o2)
assert(s.minDays(i3) == o3)
assert(s.minDays(i4) == o4)
assert(s.minDays(i5) == o5)
assert(s.minDays(i6) == o6)
assert(s.minDays(i7) == o7)
assert(s.minDays(i8) == o8)
assert(s.minDays(i9) == o9)


print("Tests Done!")

// 1 <= n <= 2*10^9 !!

/*
 There are n oranges in the kitchen and you decided to eat some of these oranges every day as follows:

 Eat one orange.
 If the number of remaining oranges (n) is divisible by 2 then you can eat  n/2 oranges.
 If the number of remaining oranges (n) is divisible by 3 then you can eat  2*(n/3) oranges.
 You can only choose one of the actions per day.

 Return the minimum number of days to eat n oranges.
 */


/*
 another sophisticated approach:
 /*
 class Solution {
     int f[65536];
     int work(int n)
     {
         if(n<65536)return f[n];
         return min(work(n>>1)+(n&1)+1,work(n/3)+n%3+1);
     }
 public:
     int minDays(int n) {
         int i;
         for(i=1;i<65536;i++)
         {
             f[i]=f[i-1];
             if(!(i&1))f[i]=min(f[i],f[i>>1]);
             if(!(i%3))f[i]=min(f[i],f[i/3]);
             f[i]++;
         }
         return work(n);
     }
 };
 */
