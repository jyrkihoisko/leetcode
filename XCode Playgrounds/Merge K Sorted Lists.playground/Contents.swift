public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        guard lists.count > 0 else { return nil }
        
        let heads = lists.filter { $0 != nil }
        var nodes = [ListNode]()
        
        for head in heads {
            var node = head
            while node != nil {
                nodes.append(node!)
                print("adding \(node!.val)")
                node = node!.next
            }
        }
        if nodes.count == 0 { return nil }
        
        let sorted = nodes.sorted { $0.val < $1.val }
        let dummy = ListNode(-1)
        var start = dummy // dummy
        
        for n in sorted {
            print("  handling \(n.val)")
            start.next = n
            start = n
        }
        start.next = nil
        return dummy.next
    }
}


/*
 target: nil; 1.2,3,4,4,5,5,6
 
 1->4->5
 5->6->7
 2->3->4
 */
let n1 = ListNode(2)
let n2 = ListNode(3)
let n3 = ListNode(5)

let n4 = ListNode(5)
let n5 = ListNode(6)
let n6 = ListNode(8)

let n7 = ListNode(1)
let n8 = ListNode(4)
let n9 = ListNode(6)
let na = ListNode(11)

n1.next = n2
n2.next = n3

n4.next = n5
n5.next = n6

n7.next = n8
n8.next = n9
n9.next = na





print("Tests started!")
let s = Solution()
let res = s.mergeKLists([n1, n4, n7])

print(res!.val)
print(res!.next!.val)
print(res!.next!.next!.val)
print(res!.next!.next!.next!.val)
print(res!.next!.next!.next!.next!.val)

let res2 = s.mergeKLists([na])
print(res2!.val)

let res3 = s.mergeKLists([na, nil, nil])
print(res3!.val)

let res4 = s.mergeKLists([nil, nil, nil])
print(res4)

print("Tests ended!")


/*
 Works but timeouts:
 class Solution {
     func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
         guard lists.count > 0 else { return nil }
         var ret: ListNode?
         
         var heads = lists.filter { $0 != nil }
         let dummy = ListNode(-1)
         ret = dummy
         var target = ret
         var contender: ListNode?
         var contenderIndex = -1
         print("here")
         
         while !heads.isEmpty {
             print("heads count: \(heads.count)")
             var i = 0
             var min = Int.max

             for head in heads {
                 if head!.val <= min {
                     print("jee")
                     min = head!.val
                     contender = head
                     contenderIndex = i
                 }
                 i += 1
             }
             print("min value: \(min); contenderIndex: \(contenderIndex)")

             if contender!.next != nil {
                 heads[contenderIndex] = contender!.next
                 print("next node in list: \(contender!.next!.val)")
                 //print("heads now \(heads[0]!.val), \(heads[1]!.val), \(heads[2]!.val)")
             } else {
                 print("found an end! removing linked list at \(contenderIndex)")
                 heads.remove(at: contenderIndex)
             }
             
             target?.next = contender
             target = target!.next
         }
         
         return ret!.next // first is dummy
     }
 }

 */
