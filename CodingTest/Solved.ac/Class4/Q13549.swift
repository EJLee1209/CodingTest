//
//  Q13549.swift
//  CodingTest
//
//  Created by 이은재 on 2/14/24.
//https://www.acmicpc.net/problem/13549

struct Q13549: Template {
    static func solution() {
        let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
        let (n, k) = (nk[0], nk[1])
        
        let INF = Int.max / 2
        var dp = Array(repeating: INF, count: 200_001)
        
        for x in 0...n {
            dp[x] = n - x
            dp[2 * x] = min(n - x, dp[2 * x])
        }
        
        if n < k {
            for x in n+1...k {
                dp[x] = min(dp[x], dp[x - 1] + 1, dp[x + 1] + 1)
                dp[2 * x] = min(dp[x], dp[2 * x])
            }
        }
        print(dp[k])
    }
}
