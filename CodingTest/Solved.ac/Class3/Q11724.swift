//
//  Q11723.swift
//  CodingTest
//
//  Created by 이은재 on 12/21/23.
//https://www.acmicpc.net/problem/11724

import Foundation

struct Q11724: Template {
    
    static func solution() {
        let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
        let (n, m) = (nm[0], nm[1])
        var visited: Set<Int> = []
        var graph: [Int: [Int]] = [:]
         
        for i in 1...n {
            graph[i] = []
        }
        
        for _ in 0..<m {
            let nodes = readLine()!.split(separator: " ").map { Int(String($0))! }
            graph[nodes[0]]!.append(nodes[1])
            graph[nodes[1]]!.append(nodes[0])
        }
        
        var cnt = 0
        for i in 1...n {
            if !visited.contains(i) {
                cnt += 1
                dfs(i)
            }
        }
        
        print(cnt)
        
        func dfs(_ node: Int) {
            visited.insert(node)
            
            for next in graph[node]! {
                if !visited.contains(next) {
                    dfs(next)
                }
            }
        }
    }
}
