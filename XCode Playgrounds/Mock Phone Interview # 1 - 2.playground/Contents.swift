import Foundation
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}


class Solution {
        
    func sumEvenGrandparent(_ root: TreeNode?) -> Int {
        var queue = [TreeNode?]()
        var sum = 0
        queue.append(root)

        while !queue.isEmpty {
            let nn = queue.removeFirst()
            if nn == nil { continue }
            let n = nn!
            
            if n.val % 2 == 0 {
                print("node: \(n.val) is even, checking grandchildren")
                sum += n.left?.left?.val ?? 0
                sum += n.left?.right?.val ?? 0
                sum += n.right?.left?.val ?? 0
                sum += n.right?.right?.val ?? 0
            }
            queue.append(n.left)
            queue.append(n.right)
        }
        print("Sum: \(sum)")
        return sum
    }
}


//public class TreeCreator {
func createTree(_ ar: [Int]) -> TreeNode {
    
    // first item is the root.
    var myAr = ar
    let firstNode = TreeNode(myAr.removeFirst())
    var q = [TreeNode]()
    q.append(firstNode)
    
    while !q.isEmpty && !myAr.isEmpty {
        let node = q.removeFirst()
        print("assigning children to \(node.val)")
        if !myAr.isEmpty {
            let n = myAr.removeFirst()
            if n != -1234 {// null
                print("\(node.val) left child: \(n)")
                node.left = TreeNode(n)
                q.append(node.left!)
            }
        }
        if !myAr.isEmpty {
            let n = myAr.removeFirst()
            if n != -1234 {// null
                print("\(node.val) right child: \(n)")
                node.right = TreeNode(n)
                q.append(node.right!)
            }
        }
    }
    
    return firstNode
}


let s = Solution()
let i = [6,7,8,2,7,1,3,9,-1234,1,4,-1234,-1234,-1234,5], o = 18
let r = createTree(i)
print("Starting Test")
assert(s.sumEvenGrandparent(r) == o)
assert(s.sumEvenGrandparent(nil) == 0)

print("Tests done!")
