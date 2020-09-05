class Solution {
    func getAllElements(_ root1: TreeNode?, _ root2: TreeNode?) -> [Int] {
        var values = [Int]()
        var q = [TreeNode?]()
        if let r1 = root1 { q.append(r1) }
        if let r2 = root2 { q.append(r2) }

        while !q.isEmpty {
            let n = q.removeFirst()!
            values.append(n.val)
            if let left = n.left {
                q.append(left)
            }
            if let right = n.right {
                q.append(right)
            }
        }
        return values.sorted()
    }
}

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

let r1 = [0,-10,10], r2 = [5,1,7,0,2], o2 = [-10,0,0,1,2,5,7,10]


let s = Solution()
print("Tests started!")
assert(s.getAllElements(createTree(r1), createTree(r2)) == o2)
assert(s.getAllElements(createTree(r1), nil) == [-10,0,10])

print("Tests Ended!")
