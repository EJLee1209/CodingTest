//
//  Q1865.swift
//  CodingTest
//
//  Created by 이은재 on 1/14/24.
//https://www.acmicpc.net/problem/1865

import Foundation

struct Q1865: Template {
    
    static func solution() {
        var result = [String]()
        let INF = Int.max / 2
        for _ in 0..<Int(readLine()!)! {

            let NMW = readLine()!.split(separator: " ").map { Int(String($0))! }
            let N = NMW[0], M = NMW[1], W = NMW[2]
            var graph = [(Int, Int, Int)]()
            var flag = false

            for _ in 0..<M {
                let SET = readLine()!.split(separator: " ").map { Int(String($0))! }
                graph.append((SET[0], SET[1], SET[2]))
                graph.append((SET[1], SET[0], SET[2]))
            }
            for _ in 0..<W {
                let SET = readLine()!.split(separator: " ").map { Int(String($0))! }
                graph.append((SET[0], SET[1], -SET[2]))
            }
            
            result.append(solve())
            
            func solve() -> String {
                if bellman_ford(graph, 1) { return "YES" }
                
                return "NO"
            }
            
            func bellman_ford(_ graph: [(Int, Int, Int)], _ start: Int) -> Bool {
                var dist = Array(repeating: INF, count: N + 1)
                dist[start] = 0
                
                for i in 1...N {
                    for (start, end, cost) in graph {
                        if dist[start] + cost < dist[end] {
                            dist[end] = dist[start] + cost
                            if i == N { // 음의 사이클 존재
                                return true
                            }
                        }
                    }
                }
                return false
            }
        }
        
        for r in result { print(r) }
    }
}
