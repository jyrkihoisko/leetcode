public class Node {
    public var val: Int
    public var neighbors: [Node?]
    public init(_ val: Int) {
        self.val = val
        self.neighbors = []
    }
}

class Solution {
    // FAST, beats 96%
    // here we use map/dictionary to store all created copies and make a quick look-up while updating
    // the list of neighbors. Key is to create copies while traversing through node's neighbors, and
    // to avoid re-creating if copy has been made already.
    func cloneGraph(_ node: Node?) -> Node? {
        guard let node = node else { return nil }
        
        let firstCopy = Node(node.val)
        var copies = [node.val: firstCopy]  // Note: This is Dictionary
        var q = [node]
        
        while !q.isEmpty {
            let node = q.removeFirst()
            node.neighbors.compactMap{$0}.forEach { neighbor in
                if copies[neighbor.val] == nil {
                    copies[neighbor.val] = Node(neighbor.val) // Make a copy
                    q.append(neighbor)
                }
                copies[node.val]?.neighbors.append(copies[neighbor.val])
            }
        }
        return firstCopy
    }
    
    func cloneGraph2(_ node: Node?) -> Node? {
        guard let node = node else { return nil }
        
        let firstCopy = Node(node.val)
        var copies = [node.val: firstCopy]  // Note: This is Dictionary
        var q = [node]
        
        while !q.isEmpty {
            let node = q.removeFirst()
            for neighbor in node.neighbors where neighbor != nil {
                if copies[neighbor!.val] == nil {
                    copies[neighbor!.val] = Node(neighbor!.val) // Make a copy
                    q.append(neighbor!)
                }
                copies[node.val]?.neighbors.append(copies[neighbor!.val])
            }
        }
        return firstCopy
    }
    
    func cloneGraphOrig(_ node: Node?) -> Node? {
        guard node != nil else { return nil }
        
        var copies = [Int: Node]()
        var q  = [node]

        while !q.isEmpty {
            let n = q.removeFirst()
            if copies[n!.val] != nil { continue }
            let copy = Node(n!.val)
            copy.neighbors = n!.neighbors
            copies[n!.val] = copy
            q += n!.neighbors.compactMap{$0}
        }
        copies.forEach { copy in
            var newNeighbors = [Node]()
            copy.value.neighbors.forEach { node in
                newNeighbors.append(copies[node!.val]!)
            }
            copy.value.neighbors = newNeighbors
        }
        // set copies
        
//        q = [node]
//
//        while !q.isEmpty {
//            let n = q.removeFirst()
//            if visits.contains(n!.val) { continue }
//            visits.insert(n!.val)
//            let copiedNode = copies[n!.val]
//            for nei in n!.neighbors {
//                copiedNode?.neighbors.append(copies[nei!.val])
//            }
//            q += n!.neighbors.compactMap{$0}
//        }
        
        return copies[node!.val]
    }
}

let s = Solution()
let adj = [[2,4],[1,3],[2,4],[1,3]]
let n1 = Node(1)
let n2 = Node(2)
let n3 = Node(3)
let n4 = Node(4)
n1.neighbors = [n2, n4]
n2.neighbors = [n1, n3]
n3.neighbors = [n2, n4]
n4.neighbors = [n1, n3]

let m1 = s.cloneGraph(n1)
print(m1!.val)
print(m1?.neighbors.count)
for n in m1!.neighbors {
    print("\(n!.val), childCount: \(n!.neighbors.count)")
}
