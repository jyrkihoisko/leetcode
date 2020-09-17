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
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        guard nums.count > 0 else { return nil }
        return helper(nums, 0, nums.count-1)
    }
    
    func helper(_ nums: [Int], _ l: Int, _ r: Int) -> TreeNode? {
        if l > r { return nil }
        let mid = (l + r) >> 1
        let node = TreeNode(nums[mid])
        node.left = helper(nums, l, mid-1)
        node.right = helper(nums, mid+1, r)
        return node
    }
    
// Original version; fast, but complex
//    class Solution {
//        func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
//            guard nums.count > 0 else { return nil }
//            let startIndex = nums.count / 2
//            let first = TreeNode(nums[startIndex])
//            helper(first, nums, 0, startIndex-1 )
//            helper(first, nums, startIndex+1, nums.count-1)
//            return first
//        }
//
//        func helper(_ node: TreeNode, _ nums: [Int], _ l: Int, _ r: Int) {
//            if l <= r {
//                let mid = (l + r) >> 1
//                let num2 = nums[mid]
//                if num2 > node.val {
//                    node.right = TreeNode(num2)
//                    // insert right
//                    helper(node.right!, nums, l,mid-1)
//                    helper(node.right!, nums, mid+1,r)
//                } else { // insert left
//                    node.left = TreeNode(num2)
//                    helper(node.left!, nums, l,mid-1)
//                    helper(node.left!, nums, mid+1,r)
//                }
//            }
//        }
//    }
}

print("Tests started")
 let s = Solution()
let t = s.sortedArrayToBST([0,1,2,3,4,5])
print("t: \(t?.val), \(t?.left?.val), \(t?.right?.val); \(t?.left?.left?.val), \(t?.left?.right?.val) \(t?.right?.left?.val), \(t?.right?.right?.val)")
print("Tests ended")
