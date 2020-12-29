class MiniTree {
    var graph: [[Int]]
    var parents: [Int] = []
    let N: Int
    
    init(_ g: [[Int]]) {
        graph = g
        N = g.count
        
        for _ in 0..<N {
            parents.append(-1)
        }
    }
    
    func prim() {
        var visited = [Bool](repeating: false, count: N)
        var lowcost = [Int](repeating: 0, count: N)
        var closest = [Int](repeating: 0, count: N)
        
        for i in 0..<N {
            lowcost[i] = g[i][0]
        }
        visited[0] = true
        
        for _ in 0..<N-1 {
            var next = 0
            var minDistance = Int.max
            for i in 0..<N {
                if visited[i] || lowcost[i] == -1 {continue}
                
                if lowcost[i] < minDistance {
                    minDistance = lowcost[i]
                    next = i
                }
            }
            
            if minDistance == Int.max {break}
            parents[next] = closest[next]
            visited[next] = true
            
            for i in 0..<N {
                if visited[i] || graph[i][next] == -1 {continue}
                
                if lowcost[i] == -1 || graph[i][next] < lowcost[i] {
                    lowcost[i] = graph[i][next]
                    closest[i] = next
                }
            }
        }
    }
    
    func Print() {
        for i in 0..<N {
            print("\(parents[i]) -> \(i)")
        }
    }
}

let g = [[-1, 2, -1, 6, -1],
         [ 2, -1, 3, 8, 5],
         [ -1, 3, -1, -1, 7],
         [ 6, 8, -1, -1, 9],
         [ -1, 5, 7, 9, -1]]
let m = MiniTree(g)
m.prim()
m.Print()
