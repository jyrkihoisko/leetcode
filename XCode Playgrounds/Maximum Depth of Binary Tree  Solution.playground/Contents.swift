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
    func maxDepth(_ root: TreeNode?) -> Int {
        guard root != nil else { return 0 }
        var ret = 0
        var q = [TreeNode?]()
        q.append(root)

        while !q.isEmpty {
            var childCount = q.count
            while childCount > 0 {
                let n = q.removeFirst()!
                childCount -= 1
                if let l = n.left {
                    q.append(l)
                }
                if let r = n.right {
                    q.append(r)
                }
            }
            ret += 1
        }
        return ret
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


let i = [3,9,20,-1234,-1234,15,7], d = 3
let i2 = [3], d2 = 1

let t1 = createTree(i)
let t2 = createTree(i2)

let s = Solution()
print("Tests started!")
assert(s.maxDepth(t1) == d)
assert(s.maxDepth(t2) == d2)

print("Tests ended!")
