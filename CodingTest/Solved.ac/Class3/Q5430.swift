//
//  Q5430.swift
//  CodingTest
//
//  Created by 이은재 on 12/19/23.
//

import Foundation

struct Q5430: Template {
    static func solution() {
        let t = Int(readLine()!)!
        for _ in 0..<t {
            let p = readLine()!
            let n = Int(readLine()!)!
            let arr = readLine()!.dropFirst().dropLast().split(separator: ",").map { String($0) }
            
            var head = 0, tail = n
            var isReversed = false
            for c in p {
                if c == "D" {
                    if isReversed { tail -= 1 }
                    else { head += 1 }
                } else if c == "R" { isReversed.toggle() }
            }
            
            if head <= tail {
                var result = arr[head..<tail]
                if isReversed { result.reverse() }
                print("[\(result.joined(separator: ","))]")
            } else {
                print("error")
            }
        }
    }
}
