//
//  Q1309.swift
//  CodingTest
//
//  Created by 이은재 on 3/12/24.
//https://www.acmicpc.net/problem/1309

struct Q1309: Template {
    static func solution() {
        let n = Int(readLine()!)!
        var dp = Array(repeating: 0, count: 100_001)
        
        dp[1] = 3
        dp[2] = 7
        if n >= 3 {
            for i in 3...n {
                dp[i] = (2*dp[i-1]+dp[i-2]) % 9901
            }
        }
        print(dp[n])
    }
}
