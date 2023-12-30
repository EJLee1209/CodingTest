//
//  Q9019.swift
//  CodingTest
//
//  Created by 이은재 on 12/27/23.
//https://www.acmicpc.net/problem/9019

import Foundation

struct Q9019: Template {
    struct Queue<T: Comparable> {
        typealias ValueType = (value: T, record: Int)
        
        private var queue: [ValueType] = []
        private var front = 0
        
        var isEmpty: Bool { front >= queue.count }
        
        mutating func enqueue(_ value: ValueType) { queue.append(value) }
        
        mutating func dequeue() -> ValueType? {
            defer {
                front += 1
            }
            return queue[front]
        }
    }
    
    static func solution() {
        let T = Int(readLine()!)!
        for _ in 0..<T {
            let ab = readLine()!.split(separator: " ").map { Int($0)! }
            let (a, b) = (ab[0], ab[1])
            
            var queue = Queue<Int>()
            queue.enqueue((a, 0))
            var visited: [Bool] = Array(repeating: false, count: 10001)
            visited[a] = true
            
            while !queue.isEmpty {
                let n = queue.dequeue()!
                if n.value == b {
                    printResult(n.record)
                    break
                }
                
                for op in OperationCode.allCases {
                    let next = operate(n: n.value, op: op)
                    
                    if !visited[next] {
                        queue.enqueue((next, n.record * 10 + op.rawValue))
                        visited[next] = true
                    }
                }
            }
        }
        
        enum OperationCode: Int, CaseIterable {
            case D = 1, S, L, R
            
            var toString: String {
                switch self {
                case .D:
                    return "D"
                case .S:
                    return "S"
                case .L:
                    return "L"
                case .R:
                    return "R"
                }
            }
        }
        
        func printResult(_ record: Int) {
            var record = record
            var result = ""
            
            while record > 0 {
                result += OperationCode(rawValue: record % 10)!.toString
                record /= 10
            }
            print(String(result.reversed()))
        }
        
        func operate(n: Int, op: OperationCode) -> Int {
            switch op {
            case .D: // n을 2배
                return n * 2 % 10000
            case .S: // n-1
                return n == 0 ? 9999 : n - 1
            case .L: // n을 왼편으로 회전
                return n % 1000 * 10 + n / 1000
            case .R: // n을 오른편으로 회전
                return n % 10 * 1000 + n / 10
            }
        }
    }
}
