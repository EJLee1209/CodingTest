//
//  Q1912.swift
//  CodingTest
//
//  Created by 이은재 on 2/27/24.
//https://www.acmicpc.net/problem/1912

struct Q1912: Template {
    static func solution() {
        let n = Int(readLine()!)!
        let v = readLine()!.split(separator: " ").map { Int(String($0))! }
        var dp = Array(repeating: 0, count: n + 1)
        var answer = -Int.max
        
        for x in stride(from: n - 1, through: 0, by: -1) {
            dp[x] = max(v[x], v[x] + dp[x + 1])
            answer = max(answer, dp[x])
        }
        
        print(answer)
    }
}
