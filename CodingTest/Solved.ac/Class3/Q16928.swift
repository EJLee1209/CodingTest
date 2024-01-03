//
//  Q16928.swift
//  CodingTest
//
//  Created by 이은재 on 1/3/24.
//https://www.acmicpc.net/problem/16928

import Foundation

struct Q16928: Template {
    struct Queue<T: Comparable> {
        private var queue = [T]()
        private var front = 0
        
        var isEmpty: Bool { return front >= queue.count }
        var count: Int { return queue.count - front }
        
        mutating func insert(_ value: T) {
            queue.append(value)
        }
        
        mutating func popFront() -> T? {
            if isEmpty { return nil }
            defer {
                front += 1
            }
            return queue[front]
        }
    }
    
    static func solution() {
        let nm = readLine()!.split(separator: " ").map { Int($0)! }
        let (n, m) = (nm[0], nm[1])
        var ladders: [Int: Int] = [:]
        var snakes: [Int: Int] = [:]
        
        for _ in 0..<n {
            let xy = readLine()!.split(separator: " ").map { Int($0)! }
            ladders[xy[0]] = xy[1]
        }
        
        for _ in 0..<m {
            let uv = readLine()!.split(separator: " ").map { Int($0)! }
            snakes[uv[0]] = uv[1]
        }
        
        var queue = Queue<Int>()
        var visited = Array(repeating: false, count: 101)
        queue.insert(1)
        visited[1] = true
        var L = 0
        var flag = false
        
        while !queue.isEmpty {
            
            for _ in 0..<queue.count {
                let now = queue.popFront()!
                if now == 100 {
                    flag = true
                    break
                }
                
                for i in 1...6 {
                    var next = now + i
                    if let y = ladders[next] {
                        next = y
                    }
                    if let v = snakes[next] {
                        next = v
                    }
                    
                    if next <= 100 && !visited[next] {
                        visited[next] = true
                        queue.insert(next)
                    }
                }
            }
            if flag {
                break
            }
            L += 1
        }
        
        print(L)
    }
}
