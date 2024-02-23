//
//  Q11729.swift
//  CodingTest
//
//  Created by 이은재 on 2/23/24.
//https://www.acmicpc.net/problem/11729

import Foundation

struct Q11729: Template {
    static func solution() {
        let n = Int(readLine()!)!
        
        print(pow(2, n) - 1)
        hanoi(n: n, start: "1", target: "3", via: "2")
        
        func hanoi(n: Int, start: String, target: String, via: String) {
            if n == 1 {
                print(start, target)
                return
            }
            
            hanoi(n: n - 1, start: start, target: via, via: target)
            print(start, target)
            hanoi(n: n - 1, start: via, target: target, via: start)
        }
    }
    
}
