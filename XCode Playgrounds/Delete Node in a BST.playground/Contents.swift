public class TreeNode: CustomDebugStringConvertible {
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
    public var debugDescription: String { return "\(val): l: \(left?.val ?? -1); r: \(right?.val ?? -1)"}
}

class Solution {
    func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
        if root == nil { return nil }
        if root!.val == key && root!.left == nil && root!.right == nil { return nil }

        let dummy: TreeNode? = TreeNode(Int.min)
        dummy!.left = root
        var node = root
        var nodeParent = dummy

        while node != nil {
            if node?.val == key {
                break
            }
            nodeParent = node
            if node!.val > key {
                node = node?.left
            } else {
                node = node?.right }
        }
        
        if node == nil { return  root } // Key not found
        
        if node?.left == nil {
            if node?.right == nil {     // Leaf with no children
                replaceNodeWithNode(nodeParent, node, key, nil)
                return dummy!.left
            } else {                    // node has right child
                replaceNodeWithNode(nodeParent, node, key, node?.right)
                return dummy!.left
            }
        } else if node?.right == nil {  // node has left child
            replaceNodeWithNode(nodeParent, node, key, node?.left)
            return dummy!.left
        }
        
        // Theory says to search for the minimum item from right branch of the node.
        // then swap values and remove the minimum item (leaf, or has one child (right).
        var minNode = node?.right
        nodeParent = node

        while minNode != nil {
            if minNode!.left != nil {
                nodeParent = minNode
                minNode = minNode!.left
            } else if minNode!.right != nil {
                node!.val = minNode!.val
                replaceNodeWithNode(nodeParent, minNode, minNode!.val, minNode!.right)
                node!.val = minNode!.val
                break
            } else {
                node!.val = minNode!.val
                replaceNodeWithNode(nodeParent, minNode, minNode!.val, nil)
                break
            }
        }
        
        return dummy!.left
    }
    func replaceNodeWithNode(_ parent: TreeNode?, _ node: TreeNode?, _ key: Int, _ replacementNode: TreeNode?) {        
        if parent!.left?.val == key {
            parent!.left = replacementNode
        }
        if parent!.right?.val == key {
            parent!.right = replacementNode
        }
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
let root = createTree([5,3,6,2,4,-1234,7]), key = 5
let root2 = createTree([5,2,-1234]), key2 = 5
let root3 = createTree([5,-1234, 7]), key3 = 5
let root4 = createTree([5,4,-1234,3,-1234,2,-1234]), key4 = 4
let root5 = createTree([5]), key5 = 5
let root6 = createTree([5,-1234,6,-1234,7,-1234,8]), key6 = 6

print("Tests Started!")
print(root)
print("Deleting...")
s.deleteNode(root, key)
print(root)
print(root.left)
print(root.right)

print("---- Test2 -----")
let r2 = s.deleteNode(root2, key2)
print(r2)
print(r2?.left)
print(r2?.right)

print("---- Test3 -----")
let r3 = s.deleteNode(root3, key3)
print(r3)
print(r3?.left)
print(r3?.right)

print("---- Test4 ----- left tree")
let r4 = s.deleteNode(root4, key4)
print(r4)
print(r4?.left)
print(r4?.right)
print(r4?.left?.left)

print("---- Test5 -----")
let r5 = s.deleteNode(root5, key5)
print(r5)
print(r5?.left)
print(r5?.right)

print("---- Test6 ----- right tree")
let r6 = s.deleteNode(root6, key6)
print(r6)
print(r6?.left)
print(r6?.right)
print(r6?.right?.right)
print("Tests ended!")
