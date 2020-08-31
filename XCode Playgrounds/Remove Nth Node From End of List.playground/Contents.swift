
public class ListNode: CustomDebugStringConvertible {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    public var debugDescription: String {
        var str = "\(val) -> "
        var ptr = next
        while ptr != nil {
            str += "\(ptr!.val) -> "
            ptr = ptr?.next
        }
        return str
    }
}

class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        if head == nil { return nil }
        if n <= 0 { return head }

        let dummy = ListNode(Int.min)
        dummy.next = head
        var ptr = dummy
        var first: ListNode? = dummy
        for _ in 0..<n { // Advance first pointer by N steps.
            first = first?.next
        }
        while first?.next != nil {  // Then advance both pointers until first pointer meets end.
            ptr = ptr.next!         // Now the second ptr will be pointing to nth item from end.
            first = first?.next!
        }
        ptr.next = ptr.next?.next
        return dummy.next ?? nil
    }
}

let s = Solution()
let l1 = ListNode(1)
let l2 = ListNode(2)
let l3 = ListNode(3)
let l4 = ListNode(4)
let l5 = ListNode(5)
l1.next = l2
l2.next = l3
l3.next = l4
l4.next = l5
l5.next = nil

print("Tests started!")
print(l1)
print(s.removeNthFromEnd(l1, 1))

print("Tests done!")
