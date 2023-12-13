//
//  Q1260.swift
//  CodingTest
//
//  Created by 이은재 on 12/13/23.
//https://acmicpc.net/problem/1260

import Foundation

struct Q1260: Template {
    static func solution() {
        struct Queue {
            private var inBox: [Int] = []
            private var outBox: [Int] = []
            
            var isEmpty: Bool { return inBox.isEmpty && outBox.isEmpty }
            
            mutating func enqueue(_ value: Int) { inBox.append(value) }
            
            mutating func dequeue() -> Int? {
                if outBox.isEmpty {
                    outBox.append(contentsOf: inBox.reversed())
                    inBox.removeAll()
                }
                
                return outBox.isEmpty ? nil : outBox.removeLast()
            }
        }
        
        let nmv = readLine()!.split(separator: " ").map { Int(String($0))! }
        let n = nmv[0], m = nmv[1], v = nmv[2]
        var graph: [Int: [Int]] = [:]
        for i in 1...n { graph[i] = [] }
        
        for _ in 0..<m {
            let nodes = readLine()!.split(separator: " ").map { Int(String($0))! }
            graph[nodes[0]]!.append(nodes[1])
            graph[nodes[1]]!.append(nodes[0])
        }
        
        graph.keys.forEach { key in
            graph[key]?.sort()
        }
        
        var checker: [Int] = Array(repeating: 0, count: n+1)
        func dfs(_ node: Int) {
            checker[node] = 1
            print(node, terminator: " ")
            for next in graph[node]! {
                if checker[next] == 0 {
                    dfs(next)
                }
            }
        }
        dfs(v)
        print()
        
        checker = Array(repeating: 0, count: n+1)
        func bfs(_ node: Int) {
            var q = Queue()
            q.enqueue(node)
            checker[node] = 1
            
            while !q.isEmpty {
                let currentNode = q.dequeue()!
                print(currentNode, terminator: " ")
                for next in graph[currentNode]! {
                    if checker[next] == 0 {
                        checker[next] = 1
                        q.enqueue(next)
                    }
                }
            }
            print()
        }
        bfs(v)
    }
}
