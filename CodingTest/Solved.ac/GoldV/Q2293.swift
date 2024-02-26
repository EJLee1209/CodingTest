//
//  Q2293.swift
//  CodingTest
//
//  Created by 이은재 on 2/26/24.
//https://www.acmicpc.net/problem/2293

import Foundation

struct Q2293: Template {
    static func solution() {
        let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
        let (n, k) = (nk[0], nk[1])
        
        var coins: [Int] = []
        for _ in 0..<n {
            coins.append(Int(readLine()!)!)
        }
        
        var dp = Array(repeating: 0, count: 10_001)
        dp[0] = 1
        
        for i in 0..<n where k >= coins[i] {
            for j in coins[i]...k {
                if dp[j] + dp[j - coins[i]] < Int(pow(2.0, 31.0)) {
                    dp[j] += dp[j - coins[i]]
                }
            }
        }
        print(dp[k])
    }
}
