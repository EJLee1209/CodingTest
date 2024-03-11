//
//  Q11052.swift
//  CodingTest
//
//  Created by 이은재 on 3/11/24.
//https://www.acmicpc.net/problem/11052

struct Q11052: Template {
    static func solution() {
        let n = Int(readLine()!)!
        let p = readLine()!.split(separator: " ").map { Int(String($0))! }
        var dp = Array(repeating: 0, count: n + 1)
        
        for i in 1...n {
            for j in 1...i {
                dp[i] = max(dp[i], dp[i-j]+p[j-1])
            }
        }
        print(dp[n])
    }
}
