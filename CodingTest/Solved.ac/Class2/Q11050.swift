//
//  Q11050.swift
//  CodingTest
//
//  Created by 이은재 on 12/6/23.
//https://www.acmicpc.net/problem/11050

import Foundation

struct Q11050: Template {
    static func solution() {
        let nk = readLine()!.split(separator: " ").map { Int($0)! }
        let (n,k) = (nk[0],nk[1])
        print(factorial(n) / (factorial(k) * factorial(n-k)))
    }
    
    static func factorial(_ n: Int) -> Int {
        if n <= 1 {
            return 1
        }
        return n * factorial(n - 1)
    }
}
