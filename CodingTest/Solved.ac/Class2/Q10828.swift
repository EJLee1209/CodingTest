//
//  Q10828.swift
//  CodingTest
//
//  Created by 이은재 on 12/6/23.
//https://www.acmicpc.net/problem/10828

import Foundation

struct Q10828: Template {
    static func solution() {
        let n = Int(readLine()!)!
        var stack = [Int]()
        
        for _ in 0..<n {
            let command = readLine()!.split(separator: " ").map { String($0) }
            stackProcess(command, &stack)
        }
    }
    
    private static func stackProcess(_ command: [String], _ stack: inout [Int]) {
        let cd = command[0]
        
        if cd == "push" {
            let value = Int(command[1])!
            stack.append(value)
        } else if cd == "pop" {
            if stack.isEmpty {
                print("-1")
                return
            }
            print(stack.removeLast())
        } else if cd == "size" {
            print(stack.count)
        } else if cd == "empty" {
            print(stack.isEmpty ? 1 : 0)
        } else if cd == "top" {
            if let top = stack.last { print(top) }
            else { print(-1) }
        } else {
            return
        }
    }
}
