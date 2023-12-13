//
//  Q1003.swift
//  CodingTest
//
//  Created by 이은재 on 12/11/23.
//

import Foundation

struct Q1003: Template {
    static func solution() {
        var memory: [Int: Int] = [:]
        
        let t = Int(readLine()!)!
        for _ in 0..<t {
            let n = Int(readLine()!)!
            if n == 0 {
                print(1, 0)
            } else if n > 0 {
                print(fibonacci(n-1, &memory), fibonacci(n, &memory))
            }
        }
    }
    
    static func fibonacci(_ n: Int, _ memory: inout [Int: Int]) -> Int {
        if n == 0 {
            return 0
        } else if n == 1 {
            return 1
        } else if let mem = memory[n] {
            return mem
        }
        else {
            memory[n] = fibonacci(n - 1, &memory) + fibonacci(n - 2, &memory)
            return memory[n]!
        }
    }
}
