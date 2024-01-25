//
//  Q9465.swift
//  CodingTest
//
//  Created by 이은재 on 1/25/24.
//https://www.acmicpc.net/problem/9465

struct Q9465: Template {
    static func solution() {
        let T = Int(readLine()!)!
        for _ in 0..<T {
            let n = Int(readLine()!)!
            var scores: [[Int]] = []
            var dp = Array(repeating: Array(repeating: 0, count: n + 2), count: 2)
            
            for _ in 0..<2 {
                let score = readLine()!.split(separator: " ").map { Int(String($0))! }
                scores.append([0, 0] + score)
            }
            
            for i in 2..<n + 2 {
                dp[0][i] = max(dp[1][i-1], dp[1][i-2]) + scores[0][i]
                dp[1][i] = max(dp[0][i-1], dp[0][i-2]) + scores[1][i]
            }
            print(max(dp[0].last!, dp[1].last!))
        }
    }
}
