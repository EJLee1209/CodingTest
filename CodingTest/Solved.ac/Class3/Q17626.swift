//
//  Q17626.swift
//  CodingTest
//
//  Created by 이은재 on 1/4/24.
//https://www.acmicpc.net/problem/17626

import Foundation

struct Q17626: Template {
    static func solution() {
        let n = Int(readLine()!)!
        var dp = Array(repeating: 0, count: n + 2)
        
        dp[1] = 1
        dp[2] = 2
        
        if n >= 3 {
            for i in 3...n {
                let x = Int(sqrt(Double(i)))
                for j in stride(from: x, through: 1, by: -1) {
                    dp[i] = dp[i] == 0 ? dp[i - j * j] + 1 : min(dp[i], dp[i - j * j] + 1)
                }
            }
        }
        print(dp[n])
    }
}
