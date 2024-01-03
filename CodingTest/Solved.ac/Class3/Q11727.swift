//
//  Q11727.swift
//  CodingTest
//
//  Created by 이은재 on 1/1/24.
//https://www.acmicpc.net/problem/11727

import Foundation

struct Q11727: Template {
    static func solution() {
        let n = Int(readLine()!)!
        var dp: [Int] = Array(repeating: 0, count: n + 2)
        
        dp[1] = 1
        dp[2] = 3
        
        if n >= 3 {
            for i in 3...n {
                dp[i] = (dp[i - 1] + 2 * dp[i - 2]) % 10_007
            }
        }
        
        print(dp[n])
    }
}
