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
        
        var queue = [TreeNode]()
        var ar = [Int]()
        queue.append(root!)
        //var childCount = 0
        var currentLevelChildExpectancy = 1
        var nextLevelChildExpectancy = 0
        var level = 2
        
        while !queue.isEmpty {

            let node = queue.removeFirst()
            print("node \(node.val)")
            
            if node.left != nil {
                print("appending \(node.left!.val)")
                ar.append(node.left!.val)
                queue.append(node.left!)
                nextLevelChildExpectancy += 1
            } else /*if node.right != nil*/ {
                ar.append(-1)
            }
            if node.right != nil {
                print("appending \(node.right!.val)")
                ar.append(node.right!.val)
                queue.append(node.right!)
                nextLevelChildExpectancy += 1
            } else /*if node.left != nil*/ {
                ar.append(-1) // empty child
            }
            currentLevelChildExpectancy -= 1
            if currentLevelChildExpectancy == 0 { // level ended
                print("all current level \(level) children traversed; next level child expectancy: \(nextLevelChildExpectancy)")
                currentLevelChildExpectancy = nextLevelChildExpectancy
                nextLevelChildExpectancy = 0
                level += 1
                if !isMirror(ar) {
                    print("ar no longer mirror: \(ar)")
                    return false
                }
                //childCount = 0
                ar = []
            }
        }
        if currentLevelChildExpectancy > 0 {
        //if childCount > 0 {
            return isMirror(ar)
        }
        return true
    }
    
    func isMirror(_ ar: [Int]) -> Bool {
        print("isMirror: ar: \(ar)")
        if ar.count == 0 { return true }
        let count = ar.count
        for i in 0..<count / 2 {
            if ar[i] != ar[count - i - 1] { return false }
        }
        return true
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
//}

let s1 = TreeNode(1)
let s2 = TreeNode(2)
let s3 = TreeNode(2)
let s4 = TreeNode(3)
let s5 = TreeNode(3)
let s6 = TreeNode(4)
let s7 = TreeNode(5)
let s8 = TreeNode(5)
let s9 = TreeNode(4)
let sa = TreeNode(8)
let sb = TreeNode(9)
let sc = TreeNode(9)
let sd = TreeNode(8)


//s1.left = s2
//s1.right = s3

s2.left = s4 // 3
s2.right = s5 // 3

//s3.left = s7 //4
//s3.right = s6 //

s4.left = s6 //4
s4.right = s7 //5

s5.left = s8 //5
s5.right = s9 //4

//s6 null null
s7.left = sa //8
s7.right = sb //9

//s8 null null
s9.left = sc //9
s9.right = sd //8

// [2,3,3, 4,5,5,4, null,null,8,9,null,null,9,8]

let s334 = TreeNode(334)
let s277 = TreeNode(277)
let s507 = TreeNode(507)
let s285 = TreeNode(285)
let s678 = TreeNode(678)
let test1Exp = true
let myTestAr = [3,4,4,5,-1234,-1234,5,6,-1234,-1234,6], output1 = true
let input2 = [3,4,4,5,-1234,-1234,5,6,-1234,-1234,6], output2 = true
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

