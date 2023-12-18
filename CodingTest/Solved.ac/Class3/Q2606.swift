//
//  Q2606.swift
//  CodingTest
//
//  Created by 이은재 on 12/18/23.
//

import Foundation

struct Q2606: Template {
    static func solution() {
        let n = Int(readLine()!)! // 컴퓨터 수
        let c = Int(readLine()!)!
        var graph: [Int: [Int]] = [:]
        (1...n).forEach { graph[$0] = [] }
        for _ in 0..<c {
            let input = readLine()!.split(separator: " ").map { Int(String($0))! }
            graph[input[0]]!.append(input[1])
            graph[input[1]]!.append(input[0])
        }
        
        var cnt = 0
        var visited: Set<Int> = [1]
        
        func dfs(_ node: Int) {
            for next in graph[node]! {
                if !visited.contains(next) {
                    cnt += 1
                    visited.insert(next)
                    dfs(next)
                }
            }
        }
        dfs(1)
        print(cnt)
    }
}
