class MyHashSet {
    
    /*
     This solution takes 10,000 bytes for small sets. As opposed to simpler solution, where we assign an array
     for all possible values (1,000,000), which takes 1 MB even for small data sets.
     The pro for array-only solution it is guaranteed to take only 1MB (when all possible values are set), where as
     linked list solution introduced here CAN TAKE UPTO 8 MB when all possible values are set.
     Typically this is not the case though.
     */
    class Node {
        var value: Int
        var next: Node?
        init(_ v: Int) { value = v }
    }

    var array = [Node?]()
    
    /** Initialize your data structure here. */
    init() {
        array = Array(repeating: nil, count: 10000)
    }
    
    func add(_ key: Int) {
        let hashIndex = key % 10000
        print("adding \(key); hashIndex: \(hashIndex)")
        if array[hashIndex] == nil {
            print("adding new node for \(key) in \(hashIndex)")
            array[hashIndex] = Node(key)
        } else {
            var node = array[hashIndex]
            var prevNode: Node? = nil
            while node != nil {
                if node!.value == key {
                    print("  already contains \(key)")
                    return
                }
                prevNode = node
                node = node!.next
            }
            prevNode!.next = Node(key)
        }
    }
    
    func remove(_ key: Int) {
        let hashIndex = key % 10000
        if array[hashIndex] == nil {
            return // all ok
        } else {
            // first check if the first item contains the value
            var node = array[hashIndex]
            if node!.value == key {
                print("removing the first node that is for \(key)")
                array[hashIndex] = node!.next
                return
            }
            var prevNode = node
            node = node?.next
            while node != nil {
                if node!.value == key {
                    print("  removing node for key \(key)")
                    prevNode?.next = node!.next
                    return
                }
                prevNode = node
                node = node!.next
            }
        }

    }
    
    /** Returns true if this set contains the specified element */
    func contains(_ key: Int) -> Bool {
        let hashIndex = key % 10000
        print("checkin \(key); hashIndex: \(hashIndex)")
        if array[hashIndex] == nil {
            return false
        } else {
            var node = array[hashIndex]
            print("  contains: checking \(node?.value ?? -1 ) == \(key)")
            while node != nil {
                if node!.value == key {
                    return true
                }
                node = node!.next
            }
        }
        return false
    }
}

/**
 * Your MyHashSet object will be instantiated and called as such:
 * let obj = MyHashSet()
 * obj.add(key)
 * obj.remove(key)
 * let ret_3: Bool = obj.contains(key)
 */
/* Conditions
 All values will be in the range of [0, 1000000].
 The number of operations will be in the range of [1, 10000].
 Please do not use the built-in HashSet library.
 */


let hashSet = MyHashSet()
hashSet.add(1)
hashSet.add(2)
assert(hashSet.contains(1) == true)    // returns true
assert(hashSet.contains(3) == false)    // returns false (not found)
hashSet.add(2);
assert(hashSet.contains(2) == true)    // returns true
hashSet.remove(2)
assert(hashSet.contains(2) == false)    // returns false (already removed)
hashSet.add(10001)
hashSet.add(10002)
hashSet.add(20002)
hashSet.add(30002)
assert(hashSet.contains(2) == false)    // returns false (already removed)
assert(hashSet.contains(20002) == true)
assert(hashSet.contains(30002) == true)
assert(hashSet.contains(10002) == true)
hashSet.remove(20002)
assert(hashSet.contains(30002) == true)
assert(hashSet.contains(20002) == false)
hashSet.remove(20002)
assert(hashSet.contains(30002) == true)
assert(hashSet.contains(20002) == false)
assert(hashSet.contains(1) == true)
assert(hashSet.contains(20002) == false)

hashSet.remove(1)
assert(hashSet.contains(20002) == false)
assert(hashSet.contains(30002) == true)
assert(hashSet.contains(1) == false)

print("tests done")
