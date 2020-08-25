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
    func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
        if root == nil { return 0 }
        if root!.left == nil && root!.right == nil { return 0 }
        var q = [TreeNode]()
        q.append(root!)
        var childCount = 0
        var sum = 0
        
        while !q.isEmpty {
            childCount = q.count
            for _ in 0..<childCount {
                let n = q.removeFirst()
                if let leftChild = n.left {
                    if leftChild.left == nil && leftChild.right == nil {
                        sum += leftChild.val
                    } else {
                        q.append(leftChild)
                    }
                }
                if let rightChild = n.right {
                    q.append(rightChild)
                }
            }
        }
        print(sum)
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

let n1 = createTree([3, 9, 20, -1234,-1234, 15, 7]), o1 = 24
let n2 = createTree([3, 9, 20, -1234,-1234, 15, 7, 1, -1234,-1234,5]), o2 = 10
let n3 = createTree([3]), o3 = 3

let s = Solution()
assert(s.sumOfLeftLeaves(n1) == o1)
assert(s.sumOfLeftLeaves(n2) == o2)
assert(s.sumOfLeftLeaves(n3) == o3)

print("Tests done!")
