//
//  Q1932.swift
//  CodingTest
//
//  Created by 이은재 on 1/17/24.
//https://www.acmicpc.net/problem/1932

struct Q1932: Template {
    static func solution() {
        let n = Int(readLine()!)!
        var triangle: [[Int]] = Array(repeating: Array(repeating: 0, count: n + 2), count: n + 1)
        for i in 1...n {
            let row = readLine()!.split(separator: " ").map{ Int(String($0))! }
            for j in 1...row.count {
                triangle[i][j] = row[j-1]
            }
        }
        
        var dp = Array(repeating: Array(repeating: 0, count: n + 2), count: n + 1)
        for i in 1...n {
            for j in 1...n {
                dp[i][j] = max(dp[i-1][j], dp[i-1][j-1]) + triangle[i][j]
            }
        }
        print(dp.last!.max()!)
    }
}
