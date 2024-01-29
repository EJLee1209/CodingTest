//
//  Q11053.swift
//  CodingTest
//
//  Created by 이은재 on 1/28/24.
//https://www.acmicpc.net/problem/11053

struct Q11053: Template {
    static func solution() {
        let n = Int(readLine()!)!
        let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
        var dp = Array(repeating: 1, count: n)
        
        for i in 0..<n {
            for j in 0..<i where numbers[i] > numbers[j] {
                dp[i] = max(dp[i], dp[j] + 1)
            }
        }
        print(dp.max()!)
    }
}
