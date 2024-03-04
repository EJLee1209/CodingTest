//
//  Q2156.swift
//  CodingTest
//
//  Created by 이은재 on 3/4/24.
//https://www.acmicpc.net/problem/2156

struct Q2156: Template {
    static func solution() {
        let n = Int(readLine()!)!
        var arr = [0]
        var dp = Array(repeating: 0, count: n + 2)
        
        for _ in 0..<n {
            arr.append(Int(readLine()!)!)
        }
        arr.append(0)
        
        dp[1] = arr[1]
        dp[2] = arr[1] + arr[2]
        
        if n >= 3 {
            for i in 3...n {
                dp[i] = max(dp[i-1], dp[i-2]+arr[i], dp[i-3]+arr[i-1]+arr[i])
            }
        }
        
        print(dp[n])
    }
}
