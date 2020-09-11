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
    
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        guard root != nil else { return [Int]() }
        var result = [Int]()

        var stack = [TreeNode?]()
        var curr = root
        
        while curr != nil || !stack.isEmpty {

            while curr != nil {
                stack.append(curr)
                curr = curr!.left
            }
            
            curr = stack.removeLast()
            result.append(curr!.val)
            curr = curr!.right
        }
        return result
        
// RECURSIVE: EASY!
//        traverse(root!, &result)
//        return result
//    }
//    func traverse(_ r: TreeNode, _ res: inout [Int]) {
//        if let l = r.left {
//            traverse(l, &res)
//        }
//
//        res.append(r.val)
//
//        if let ri = r.right {
//            traverse(ri, &res)
//        }
    }
}

let r1 = TreeNode(1)
let r2 = TreeNode(2)
let r3 = TreeNode(3)
let r4 = TreeNode(4)
let r5 = TreeNode(5)

r1.right = r2
r2.left = r3
r2.right = r4
r4.left = r5

print("Test Started!")
let s = Solution()
print(s.inorderTraversal(r1))
print("Test Ended!")
