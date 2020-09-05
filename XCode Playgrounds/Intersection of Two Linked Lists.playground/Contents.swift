class Solution {
    // From LeetCode:
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        var pa = headA, pb = headB
        while pa !== pb {
            pa = (pa != nil) ? pa!.next : headB
            pb = (pb != nil) ? pb!.next : headA
        }
        return pa
    }
}

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

let s = Solution()
let a1 = ListNode(1)
let a2 = ListNode(9)
let a3 = ListNode(1)
let ab3 = ListNode(2)
let ab4 = ListNode(4)
let b1 = ListNode(3)
a1.next = a2
a2.next = a3
a3.next = ab3
ab3.next = ab4
b1.next = ab3



print("Tests Started!")

assert(s.getIntersectionNode(a1, b1) === ab3)
print("---- test 2 ----")
b1.next = ab4
assert(s.getIntersectionNode(a1, b1) === ab4)
print("---- test 3 ----")
b1.next = nil
assert(s.getIntersectionNode(a1, b1) == nil)

print("---- test 4 ----")
assert(s.getIntersectionNode(a1, a1) === a1)

print("---- test 5 ----")
b1.next = a2
assert(s.getIntersectionNode(a1, b1) === a2)
print("Tests Ended!")


/*
 // Fast solution from LeetCode:
 public ListNode getIntersectionNode(ListNode headA, ListNode headB) {
     ListNode pa = headA, pb = headB;
     while (pa != pb) {
         pa = (pa != null) ? pa.next : headB;
         pb = (pb != null) ? pb.next : headA;
     }
     return pa;
 }
 */
