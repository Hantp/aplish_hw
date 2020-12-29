struct Edge {
    let node1: Int
    let node2: Int
    let weight: Int
}

class MiniTree {
    private var edges: [Edge]
    private let N: Int
    private var leaders: [Int]
    
    init(_ g: [[Int]]) {
        edges = []
        leaders = []
        
        N = g.count
        for i in 0..<N {
            for j in 0..<N {
                if g[i][j] != -1 {
                    edges.append(Edge(node1: i, node2: j, weight: g[i][j]))
                }
            }
        }
        
        for i in 0..<N {
            leaders.append(i)
        }
    }
    
    func kruskal() -> Int {
        guard N > 0 else {return -1}
        
        let sortedEdges = edges.sorted(by: { (a, b) -> Bool in
            return a.weight < b.weight
        })
        
        var totalWight = 0
        for edge in sortedEdges {
            let l1 = findLeader(edge.node1)
            let l2 = findLeader(edge.node2)
            if l1 != l2 {
                leaders[l2] = l1
                leaders[edge.node2] = l1
                totalWight += edge.weight
            }
        }
        
        return totalWight
    }
    
    func findLeader(_ p: Int) -> Int {
        if p == leaders[p] {return p}
        else {return findLeader(leaders[p])}
    }
}

let g = [[-1, 2, -1, 6, -1],
         [ 2, -1, 3, 8, 5],
         [ -1, 3, -1, -1, 7],
         [ 6, 8, -1, -1, 9],
         [ -1, 5, 7, 9, -1]]
let m = MiniTree(g)
print(m.kruskal())
