//
//  Q9251.swift
//  CodingTest
//
//  Created by 이은재 on 1/24/24.
//https://www.acmicpc.net/problem/9251

struct Q9251: Template {
    static func solution() {
        let X = Array(readLine()!).map { String($0) }
        let Y = Array(readLine()!).map { String($0) }
        print(lcs(x: X, y: Y))
        
        func lcs(x: [String], y: [String]) -> Int {
            let (m, n) = (x.count, y.count)
            var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: m + 1)
            let x = [""] + x
            let y = [""] + y
            
            for i in 1...m {
                for j in 1...n {
                    if x[i] == y[j] {
                        dp[i][j] = dp[i - 1][j - 1] + 1
                    } else {
                        dp[i][j] = max(dp[i - 1][j] , dp[i][j - 1])
                    }
                }
            }
            
            return dp[m][n]
        }
    }
}
