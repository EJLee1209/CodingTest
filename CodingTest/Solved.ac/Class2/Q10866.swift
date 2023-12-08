//
//  Q10866.swift
//  CodingTest
//
//  Created by 이은재 on 12/6/23.
//

import Foundation

struct Q10866: Template {
    
    struct Deque<T: Comparable> {
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
        
        mutating func pushFront(_ value: T) {
            outBox.append(value)
        }
        
        mutating func pushBack(_ value: T) {
            inBox.append(value)
        }
        
        mutating func popFront() -> T? {
            if outBox.isEmpty {
                outBox.append(contentsOf: inBox.reversed())
                inBox.removeAll()
            }
            
            return outBox.isEmpty ? nil : outBox.removeLast()
        }
        
        mutating func popBack() -> T? {
            if !inBox.isEmpty { return inBox.removeLast() }
            
            return outBox.isEmpty ? nil : outBox.removeFirst()
        }
    }
    
    static func solution() {
        let n = Int(readLine()!)!
        var deque = Deque<Int>()
        for _ in 0..<n {
            let command = readLine()!.split(separator: " ").map { String($0) }
            dequeProcess(command, &deque)
        }
    }
    
    static func dequeProcess(_ command: [String], _ deque: inout Deque<Int>) {
        let cd = command[0]
        switch cd {
        case "push_front":
            deque.pushFront(Int(command[1])!)
        case "push_back":
            deque.pushBack(Int(command[1])!)
        case "pop_front":
            if let value = deque.popFront() { print(value) }
            else { print(-1) }
        case "pop_back":
            if let value = deque.popBack() { print(value) }
            else { print(-1) }
        case "size":
            print(deque.size)
        case "empty":
            print(deque.empty)
        case "front":
            if let front = deque.front { print(front) }
            else { print(-1) }
        case "back":
            if let back = deque.back { print(back) }
            else { print(-1) }
        default:
            return
        }
    }
}
