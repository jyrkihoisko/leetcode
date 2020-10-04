class ThroneInheritance {
// Key observation here is NOT to use BFS/DFS for setting births and deaths, but instead use
// plain good old HashMap...

    class Person {
        var name = ""
        var parent: Person?
        var children = [Person]()
        var isAlive = true
        init(_ name: String, _ p: Person?) { self.name = name; self.parent = p }
    }
    
    var order = [String: Person]()
    var firstKing = ""
    var firstAlive = ""
    
    init(_ kingName: String) {
        order[kingName] = Person(kingName, nil)
        firstKing = kingName
    }
    
    func birth(_ parentName: String, _ childName: String) {
        let child = Person(childName, order[parentName]!)
        let parent = order[parentName]
        parent?.children.append(child)
        order[childName] = child
    }
    
    func death(_ name: String) {
        let p = order[name]
        if p != nil { p!.isAlive = false }
    }
    
    func getInheritanceOrder() -> [String] {
        var ret = [String]()
        
        func helper(_ name: String) {
            let p = order[name]!
            if p.isAlive { ret.append(p.name) }
            for c in p.children {
                helper(c.name)
            }
        }
        helper(firstKing)
        return ret
    }
}

/**
 * Your ThroneInheritance object will be instantiated and called as such:
 * let obj = ThroneInheritance(kingName)
 * obj.birth(parentName, childName)
 * obj.death(name)
 * let ret_3: [String] = obj.getInheritanceOrder()
 */

