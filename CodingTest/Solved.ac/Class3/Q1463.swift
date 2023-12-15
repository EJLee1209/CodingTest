//
//  Q1463.swift
//  CodingTest
//
//  Created by 이은재 on 12/14/23.
//https://www.acmicpc.net/problem/1463

import Foundation

struct Q1463: Template {
    static func solution() {
        let n = Int(readLine()!)!
        var dp = Array<Int>(repeating: 0, count: n + 1)
        
        if n > 1 {
            for i in 2...n {
                var value1 = 10000000
                var value2 = 10000000
                
                if i % 3 == 0 {
                    value1 = dp[i / 3] + 1
                }
                if i % 2 == 0 {
                    value2 = dp[i / 2] + 1
                }
                
                dp[i] = min(dp[i - 1] + 1, value1, value2)
            }
        }
        
        print(dp[n])
    }
}
