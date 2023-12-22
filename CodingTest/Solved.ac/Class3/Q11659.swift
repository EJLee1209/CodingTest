//
//  Q11659.swift
//  CodingTest
//
//  Created by 이은재 on 12/21/23.
//https://www.acmicpc.net/problem/11659

import Foundation

struct Q11659: Template{
    static func solution() {
        let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
        let (n, m) = (nm[0], nm[1])
        let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
        var dp: [Int] = Array(repeating: 0, count: n + 1)
        for i in 1...n {
            dp[i] = dp[i-1] + numbers[i-1]
        }
        
        for _ in 0..<m {
            let ij = readLine()!.split(separator: " ").map { Int(String($0))! }
            let (i, j) = (ij[0], ij[1])
            print(dp[j]-dp[i-1])
        }
    }
}
