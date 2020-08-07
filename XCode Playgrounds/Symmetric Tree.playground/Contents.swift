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
    func isSymmetric(_ root: TreeNode?) -> Bool {
        guard root != nil else { return true }

        // iterative
        print("IsSymmetric starts")
        var queue = [TreeNode]()
        var queue2 = queue
        
        queue.append(root!)
        queue2.append(root!)
        
        while !queue.isEmpty && !queue2.isEmpty {

            let node = queue.removeFirst()
            let node2 = queue2.removeFirst()
            
            print("node1: \(node.val)")
            print("node2: \(node2.val)")
            var ar1 = [Int]()
            var ar2 = [Int]()

            if node.left != nil {
                print("queue1: node \(node.val) appending left child: \(node.left!.val)")
                ar1.append(node.left!.val)
                queue.append(node.left!)
            } else { ar1.append(-1) }
            if node.right != nil {
                print("queue1: node \(node.val) appending right child: \(node.right!.val)")
                ar1.append(node.right!.val)
                queue.append(node.right!)
            } else { ar1.append(-1) }
            if node2.right != nil {
                print("queue2: node2 \(node2.val) appending right child: \(node2.right!.val)")
                ar2.append(node2.right!.val)
                queue2.append(node2.right!)
            } else { ar2.append(-1) }
            if node2.left != nil {
                print("queue2: node2 \(node.val) appending left child: \(node2.left!.val)")
                ar2.append(node2.left!.val)
                queue2.append(node2.left!)
            } else { ar2.append(-1) }
            
            if ar1 != ar2 { return false }
        }
        return queue.count != queue2.count ? false : true
    }
}


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
                print("Node: \(node.val) left child: \(n)")
                node.left = TreeNode(n)
                q.append(node.left!)
            }
        }
        if !myAr.isEmpty {
            let n = myAr.removeFirst()
            if n != -1234 {// null
                print("Node: \(node.val) right child: \(n)")
                node.right = TreeNode(n)
                q.append(node.right!)
            }
        }
    }
    
    return firstNode
}

let test1Exp = true
let myTestAr = [1,2,2, -1234,3,-1234,3], output1 = false
let input2 = [3, 4,4, 5,-1234,-1234,5, 6,-1234,-1234,6], output2 = true //[3,4,4,5,null,null,5,6,null,null,6]
let input3 = [2,3,3,4,5,5,4,-1234,-1234,8,9,-1234,-1234,9,8], output3 = false // -1234 denotes null
let input4 = [Int](), output4 = true
let test1Node = createTree(myTestAr)
let test2Node = createTree(input2)
let test3Node = createTree(input3)
//let test4Node = createTree(input4)

let s = Solution()

//assert(s.isSymmetric(s2) == true)
assert(s.isSymmetric(test1Node) == output1)
assert(s.isSymmetric(test2Node) == output2)
assert(s.isSymmetric(test3Node) == output3)
assert(s.isSymmetric(nil) == output4)
print("Tests done!")

