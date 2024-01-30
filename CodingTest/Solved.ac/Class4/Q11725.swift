//
//  Q11725.swift
//  CodingTest
//
//  Created by 이은재 on 1/30/24.
//https://www.acmicpc.net/problem/11725

struct Q11725: Template {
    static func solution() {
        let n = Int(readLine()!)!
        var graph: [Int: [Int]] = [:]
        (1...n).forEach { graph[$0] = [] }
        for _ in 1..<n {
            let input = readLine()!.split(separator: " ").map { Int(String($0))! }
            graph[input[0]]!.append(input[1])
            graph[input[1]]!.append(input[0])
        }
        
        var queue = [1]
        var front = 0
        var parentNodes = Array(repeating: 0, count: n + 1)
        parentNodes[1] = 1
        
        while front < queue.count {
            let node = queue[front]
            front += 1
            
            for nextNode in graph[node]! where parentNodes[nextNode] == 0 {
                parentNodes[nextNode] = node
                queue.append(nextNode)
            }
        }
        
        for i in 2...n {
            print(parentNodes[i])
        }
    }
}
