//
//  Q11403.swift
//  CodingTest
//
//  Created by 이은재 on 12/31/23.
//https://www.acmicpc.net/problem/11403

import Foundation

struct Q11403: Template {
    static func solution() {
        let n = Int(readLine()!)!
        var graph: [[Int]] = []
        var route: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)
        
        for _ in 0..<n {
            graph.append(readLine()!.split(separator: " ").map { Int($0)! })
        }
        
        var visited = Array(repeating: false, count: n)
        for i in 0..<n {
            // 0~n번의 모든 정점에서 다른 정점으로의 경로를 찾기 위해 dfs를 수행
            dfs(i, i)
            visited = Array(repeating: false, count: n)
        }
        
        func dfs(_ start: Int, _ now: Int) {
            for next in 0..<n {
                if graph[now][next] == 1 && !visited[next] {
                    route[start][next] = 1
                    visited[next] = true
                    dfs(start, next)
                }
            }
        }
        
        for i in 0..<n {
            for j in 0..<n {
                print(route[i][j], terminator: " ")
            }
            print()
        }
    }
}
