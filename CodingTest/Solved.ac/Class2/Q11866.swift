//
//  Q11866.swift
//  CodingTest
//
//  Created by 이은재 on 12/7/23.
//https://www.acmicpc.net/problem/11866

import Foundation

struct Q11866: Template {
    
    struct Queue<T: Comparable> {
        private var inBox: [T] = []
        private var outBox: [T] = []
        
        var isEmpty: Bool {
            return inBox.isEmpty && outBox.isEmpty
        }
        
        mutating func enqueue(_ value: T) {
            inBox.append(value)
        }
        
        mutating func dequeue() -> T? {
            if outBox.isEmpty {
                outBox.append(contentsOf: inBox.reversed())
                inBox.removeAll()
            }
            
            return outBox.isEmpty ? nil : outBox.removeLast()
        }
    }
    
    static func solution() {
        let nk = readLine()!.split(separator: " ").map { Int($0)! }
        let (n,k) = (nk[0], nk[1])
        var queue = Queue<Int>()
        (1...n).forEach { queue.enqueue($0) }
        var result: [Int] = []
        
        var cnt = 1
        while !queue.isEmpty {
            if cnt == k {
                result.append(queue.dequeue()!)
                cnt = 1
            } else {
                queue.enqueue(queue.dequeue()!)
                cnt += 1
            }
        }
        print("<\(result.map { String($0) }.joined(separator: ", "))>")
    }
}
