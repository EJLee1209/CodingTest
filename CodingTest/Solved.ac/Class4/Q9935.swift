//
//  Q9935.swift
//  CodingTest
//
//  Created by 이은재 on 1/27/24.
//https://www.acmicpc.net/problem/9935

struct Q9935: Template {
    static func solution() {
        let input = readLine()!
        let target = readLine()!
        var stack = [String]()
        
        let targetLast = target.last!
        let targetLen = target.count
        
        for c in input {
            stack.append(String(c))
            
            if c == targetLast {
                let len = stack.count
                if len >= targetLen && stack[(len - targetLen)...].joined() == target {
                    (0..<targetLen).forEach { _ in
                        stack.removeLast()
                    }
                }
            }
            
        }
        print(stack.isEmpty ? "FRULA" : stack.joined())
    }
}
