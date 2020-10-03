
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        var overflow = 0
        let dummy = ListNode(-1)
        var n1 = l1, n2 = l2
        var node = dummy
        
        while n1 != nil || n2 != nil || overflow > 0 {
            let sum = (n1 != nil ? n1!.val : 0) + (n2 != nil ? n2!.val : 0) + overflow
            node.next = ListNode(sum % 10)
            node = node.next!
            n1 = n1?.next
            n2 = n2?.next
            overflow = sum / 10
        }

        return dummy.next
    }
}


let l1 = ListNode(2)
let l2 = ListNode(4)
let l3 = ListNode(8)

let l4 = ListNode(5)
let l5 = ListNode(6)
let l6 = ListNode(4)

l1.next = l2
l2.next = l3

l4.next = l5
l5.next = l6

print("Tests started")
let s = Solution()
var ln = s.addTwoNumbers(l1, l4)
print("\(ln!.val), \(ln!.next!.val), \(ln!.next!.next!.val)")
while ln != nil { print("\(ln!.val), "); ln = ln!.next }

print("Test 2")
let ln2 = s.addTwoNumbers(l6, nil)
print("ln2: \(ln2!.val)")
print("Tests ended")
