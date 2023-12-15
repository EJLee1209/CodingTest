//
//  Q1389.swift
//  CodingTest
//
//  Created by 이은재 on 12/14/23.
//https://www.acmicpc.net/problem/1389

import Foundation

struct Q1389: Template {
    static func solution() {
        struct Queue {
            private var inBox: [Int] = []
            private var outBox: [Int] = []
            
            var isEmpty: Bool { return inBox.isEmpty && outBox.isEmpty }
            
            var size: Int { return inBox.count + outBox.count }
            
            mutating func enqueue(_ value: Int) { inBox.append(value) }
            
            mutating func dequeue() -> Int? {
                if outBox.isEmpty {
                    outBox.append(contentsOf: inBox.reversed())
                    inBox.removeAll()
                }
                
                return outBox.isEmpty ? nil : outBox.removeLast()
            }
        }
        
        let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
        let (n,m) = (nm[0],nm[1])
        var graph: [Int: [Int]] = [:]
        
        for i in 1...n { graph[i] = [] }
        
        for _ in 0..<m {
            let se = readLine()!.split(separator: " ").map { Int(String($0))! }
            graph[se[0]]!.append(se[1])
            graph[se[1]]!.append(se[0])
        }
        
        var minNumber = 2147000000
        var result = 0
        for i in 1...n {
            let kebinNumber = kebinBaconNumber(i)
            if minNumber > kebinNumber {
                result = i
                minNumber = kebinNumber
            }
        }
        print(result)
        
        func kebinBaconNumber(_ startNode: Int) -> Int {
            var visited: [Bool] = Array(repeating: false, count: n + 1)
            var queue = Queue()
            queue.enqueue(startNode)
            visited[startNode] = true
            
            var L = 1
            var distance = 0
            while !queue.isEmpty {
                for _ in 0..<queue.size {
                    let currentNode = queue.dequeue()!

                    for nextNode in graph[currentNode]! {
                        if !visited[nextNode] {
                            distance += L
                            visited[nextNode] = true
                            queue.enqueue(nextNode)
                        }
                    }
                }
                L+=1
            }
            return distance
        }
    }
}
