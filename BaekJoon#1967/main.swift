//
//  main.swift
//  BaekJoon#1967
//
//  Created by 김병엽 on 2023/09/07.
//

let n = Int(readLine()!)!
var graph: [[(Int, Int)]] = Array(repeating: [(Int, Int)](), count: n + 1)

for _ in 0..<(n - 1) {
    
    let t = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (pNode, cNode, edgeCost) = (t[0], t[1], t[2])
    graph[pNode].append((cNode, edgeCost))
    graph[cNode].append((pNode, edgeCost))
}


func bfs(start: Int) -> (node: Int, dist: Int) {
    
    var visited: [Bool] = Array(repeating: false, count: n + 1)
    visited[start] = true
    
    var queue = [(start, 0)]
    var idx = 0
    
    // 최대 거리 점 / 거리가 저장될 변수
    var maxDist = 0
    var maxNode = 0
    
    while queue.count > idx {
        
        let (curNode, curDist) = queue[idx]
        idx += 1
        
        if curDist >= maxDist {
            maxDist = curDist
            maxNode = curNode
        }
        
        for (nx, dist) in graph[curNode] {
            
            if !visited[nx] {
                
                visited[nx] = true
                queue.append((nx, curDist + dist))
            }
        }
    }
    
    return (maxNode, maxDist)
}


let node = bfs(start: 1).node

let distance = bfs(start: node).dist

print(distance)
