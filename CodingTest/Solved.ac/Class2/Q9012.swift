//
//  Q9012.swift
//  CodingTest
//
//  Created by 이은재 on 12/5/23.
//

import Foundation

struct Q9012: Template {
    static func solution() {
        let n = Int(readLine()!)!
        for _ in 0..<n {
            let input = readLine()!.map { String($0) }
            var stack = [String]()
            
            var flag = true
            for (_, c) in input.enumerated() {
                if c == "(" {
                    stack.append(c)
                    continue
                }
                if !stack.isEmpty && stack.last! == "(" {
                    stack.removeLast()
                } else {
                    flag.toggle()
                    break
                }
            }
            if flag { flag = stack.isEmpty }
            
            print(flag ? "YES" : "NO")
        }
    }
}
