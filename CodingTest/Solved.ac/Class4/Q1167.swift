//
//  Q1167.swift
//  CodingTest
//
//  Created by 이은재 on 1/10/24.
//https://www.acmicpc.net/problem/1167

import Foundation

struct Q1167: Template {
    static func solution() {
        typealias Edge = (distance: Int, node: Int)
        
        let V = Int(readLine()!)!
        var tree: [Int: [Edge]] = [:]
        
        (1...V).forEach { tree[$0] = [] }
        
        for _ in 0..<V {
            let input = readLine()!.split(separator: " ").map { Int(String($0))! }.dropLast()
            
            for i in stride(from: 1, to: input.count - 1, by: 2) {
                tree[input[0]]?.append((input[i + 1], input[i]))
            }
        }
        
        var visited = Array(repeating: false, count: V + 1)
        var length = 0
        var finalNode = 0
        
        func dfs(_ node: Int, _ depth: Int) {
            visited[node] = true
            
            if depth > length {
                length = depth
                finalNode = node
            }
            
            for (distance, nextNode) in tree[node]! {
                if !visited[nextNode] {
                    dfs(nextNode, depth + distance)
                }
            }
        }
        
        dfs(1, 0)
        length = 0
        visited = Array(repeating: false, count: V + 1)
        dfs(finalNode, 0)
        print(length)
    }
}
