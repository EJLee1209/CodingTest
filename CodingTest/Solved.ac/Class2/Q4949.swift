//
//  Q4949.swift
//  CodingTest
//
//  Created by 이은재 on 12/6/23.
//https://www.acmicpc.net/problem/4949

import Foundation

struct Q4949: Template {
    static func solution() {
        while true {
            let input = readLine()!.map { String($0) }
            if input == ["."] { break }
            
            var stack = [String]()
            var flag = true
            
            for (_, c) in input.enumerated() {
                if c == "(" { stack.append(")") }
                else if c == "[" { stack.append("]") }
                else if c == ")" || c == "]" {
                    if stack.isEmpty || stack.removeLast() != c {
                        flag.toggle()
                        break
                    }
                }
            }
            if flag { flag = stack.isEmpty }
            
            print(flag ? "yes" : "no")
        }
    }
}
