//
//  Q10773.swift
//  CodingTest
//
//  Created by 이은재 on 12/6/23.
//

import Foundation

struct Q10773: Template {
    static func solution() {
        let k = Int(readLine()!)!
        var stack = [Int]()
        
        for _ in 0..<k {
            let num = Int(readLine()!)!
            if num > 0 { stack.append(num) }
            else if num == 0 && !stack.isEmpty { stack.removeLast() }
        }
        print(stack.reduce(0, +))
    }
}
