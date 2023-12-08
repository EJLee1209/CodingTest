//
//  Q10845.swift
//  CodingTest
//
//  Created by 이은재 on 12/6/23.
//

import Foundation

struct Q10845: Template {
    
    struct Queue<T: Comparable> {
        private var inBox: [T] = []
        private var outBox: [T] = []
        
        var size: Int {
            return inBox.count + outBox.count
        }
        
        var empty: Int {
            return inBox.isEmpty && outBox.isEmpty ? 1 : 0
        }
        
        var front: T? {
            return outBox.last == nil ? inBox.first : outBox.last
        }
        
        var back: T? {
            return inBox.last == nil ? outBox.first : inBox.last
        }
        
        mutating func push(_ value: T) {
            inBox.append(value)
        }
        
        @discardableResult
        mutating func pop() -> T? {
            if outBox.isEmpty {
                outBox.append(contentsOf: inBox.reversed())
                inBox.removeAll()
            }
            return outBox.isEmpty ? nil : outBox.removeLast()
        }
    }
    
    
    static func solution() {
        let n = Int(readLine()!)!
        var queue = Queue<Int>()
        for _ in 0..<n {
            let command = readLine()!.split(separator: " ").map { String($0) }
            queueProcess(command, &queue)
        }
    }
    
    static func queueProcess(_ command: [String], _ queue: inout Queue<Int>) {
        let cd = command[0]
        if cd == "push" {
            queue.push(Int(command[1])!)
        } else if cd == "pop" {
            if let value = queue.pop() { print(value) } else { print(-1) }
        } else if cd == "size" {
            print(queue.size)
        } else if cd == "empty" {
            print(queue.empty)
        } else if cd == "front" {
            if let front = queue.front { print(front) } else { print(-1) }
        } else if cd == "back" {
            if let back = queue.back { print(back) } else { print(-1) }
        } else { return }
    }
}
