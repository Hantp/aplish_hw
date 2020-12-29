func shortestDistance(from start: Int, to end: Int,  graph g: [[Int]]) -> (Int, [Int]?) {
    let n = g.count
    
    var visited = [Bool](repeating: false, count: n)
    visited[start] = true
    
    var shortest = [Int](repeating: Int.max, count: n)
    shortest[start] = 0
    
    for i in 0..<n {
        shortest[i] = (g[i][start] == -1) ? Int.max : g[i][start]
    }
    
    var parents = [Int](repeating: 0, count: n)
    for _ in 0..<n {
        var cur = 0
        var minDistance = Int.max
        for i in 0..<n {
            if !visited[i] && shortest[i] < minDistance {
                cur = i
                minDistance = shortest[i]
            }
        }
        
        guard minDistance != Int.max else {return (-1, nil)}
        
        visited[cur] = true
        if cur == end {
            return (minDistance, parents)
        }
        
        for i in 0..<n {
            if visited[i] || g[cur][i] == -1 {continue}
            
            if shortest[cur] + g[cur][i] < shortest[i] {
                shortest[i] = shortest[cur] + g[cur][i]
                parents[i] = cur
            }
        }
    }
    
    return (-1, nil)
}

let g = [[-1, 2, -1, 6, -1],
         [ 2, -1, 3, 8, 5],
         [ -1, 3, -1, -1, 7],
         [ 6, 8, -1, -1, 9],
         [ -1, 5, 7, 9, -1]]
let (d, parents) = shortestDistance(from: 0, to: 4, graph: g)
print(d)
var cur = 4
while cur != 0 {
    print(cur)
    cur = parents![cur]
}
