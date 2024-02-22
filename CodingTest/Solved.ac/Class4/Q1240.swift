//
//  Q1240.swift
//  CodingTest
//
//  Created by 이은재 on 2/22/24.
//https://www.acmicpc.net/problem/1240

struct Q1240: Template {
    static func solution() {
        let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
        let (n, m) = (nm[0], nm[1])
        
        var graph = [Int: [(node: Int, distance: Int)]]()
        (1...n).forEach { graph[$0] = [] }
        
        for _ in 1..<n {
            let input = readLine()!.split(separator: " ").map { Int(String($0))! }
            let (s, e, w) = (input[0], input[1], input[2])
            
            graph[s]!.append((e, w))
            graph[e]!.append((s, w))
        }
        
        var result = ""
        var answer: Int = 0
        var visited: [Bool] = []
        var targetNode: Int = 0
        for _ in 0..<m {
            let input = readLine()!.split(separator: " ").map { Int(String($0))! }
            let (s, e) = (input[0], input[1])
            
            targetNode = e
            visited = Array(repeating: false, count: n + 1)
            answer = Int.max
            dfs(node: s, distance: 0)
            result += "\(answer)\n"
        }
        print(result)
        
        func dfs(node: Int, distance: Int) {
            if distance >= answer {
                return
            }
            if node == targetNode {
                answer = distance
                return
            }
            visited[node] = true
            
            for nextEdge in graph[node]! where !visited[nextEdge.node] {
                dfs(node: nextEdge.node, distance: distance + nextEdge.distance)
            }
        }
    }
}
