//
//  Q1697.swift
//  CodingTest
//
//  Created by 이은재 on 12/15/23.
//

import Foundation

struct Q1697: Template {
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
    
    static func solution() {
        let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
        let (n,k) = (nk[0],nk[1])
        
        var visited: Set<Int> = []
        var queue = Queue()
        var distance: [Int] = Array(repeating: 0, count: 100001)
        queue.enqueue(n)
        visited.insert(n)

        while !queue.isEmpty {
            let currentX = queue.dequeue()!
            
            for x in [currentX-1, currentX+1, 2*currentX] {
                if x >= 0 && x <= 100000 && !visited.contains(x) {
                    queue.enqueue(x)
                    visited.insert(x)
                    
                    distance[x] = distance[currentX] + 1
                }
            }
        }
        print(distance[k])
    }
}
