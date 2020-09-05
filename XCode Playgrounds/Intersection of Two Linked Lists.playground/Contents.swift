class Solution {
    // Intuition -driven approach.
    // Works; is comparatively fast, but overly too complex.
    
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        
        if headA == nil || headB == nil { return nil }
        if headA === headB { return headA }
        
        let aL = length(headA)
        let bL = length(headB)
        // print("A length: \(aL.0); B length: \(bL.0)")
        if aL.1 !== bL.1 { return nil }
        let rA = reverse(headA)
        let nBL = length(headB)
        // print(" new B length: \(nBL.0)")
        print("location of intersect: \((aL.count - nBL.count + bL.count) / 2) from end")
        reverse(rA)
        
        // Traverse to nth node from end (two pointers -method)
        var ptrA = headA
        var ptrB = ptrA
        
        for _ in 0..<(aL.count - nBL.count + bL.count) / 2 {
            ptrA = ptrA?.next
        }
        while ptrA?.next != nil {
            ptrA = ptrA?.next
            ptrB = ptrB?.next
        }
        print("ptrB points to \(ptrB!.val)")
        return ptrB
    }
    
    func length(_ head: ListNode?) -> (count: Int, tail: ListNode?) {
        var count = 0
        var n = head
        var prevHead: ListNode?
        while n != nil {
            prevHead = n
            n = n?.next
            count += 1
        }
        print("head starting at \(head!.val) count \(count - 1)")
        return (count - 1, prevHead)
    }
    
    func reverse(_ head: ListNode?) -> ListNode? {
        var prev: ListNode?
        var next: ListNode?
        var n = head
        while n != nil {
            next = n?.next
            n?.next = prev
            prev = n
            n = next
        }
        return prev
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
