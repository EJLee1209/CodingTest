//
//  Q1874.swift
//  CodingTest
//
//  Created by 이은재 on 11/25/23.
//https://www.acmicpc.net/problem/1874

import Foundation

struct Q1874: Template {
    static func solution() {
        let n = Int(readLine()!)!
        var numbers: [Int] = []
        var stack: [Int] = []
        var result: [String] = []
        
        for _ in 0..<n {
            numbers.append(Int(readLine()!)!)
        }
        
        var idx = 0
        for i in 1...n {
            stack.append(i)
            result.append("+")
            
            while !stack.isEmpty && stack.last! == numbers[idx] {
                stack.popLast()
                result.append("-")
                idx += 1
            }
        }
        
        if stack.isEmpty {
            result.forEach { v in
                print(v)
            }
        } else {
            print("NO")
        }
        
    }
}
