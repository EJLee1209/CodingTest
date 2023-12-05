//
//  Q2775.swift
//  CodingTest
//
//  Created by 이은재 on 12/5/23.
//

import Foundation

struct Q2775: Template {
    static func solution() {
        var dp = Array(repeating: Array(repeating: 0, count: 15), count: 15)
        for i in 1..<15 { dp[0][i] = i }
        
        for i in 1..<15 {
            for j in 1..<15 {
                dp[i][j] = dp[i][j-1] + dp[i-1][j]
            }
        }
        
        let t = Int(readLine()!)!
        
        for _ in 0..<t {
            let k = Int(readLine()!)!
            let n = Int(readLine()!)!
            
            print(dp[k][n])
        }
    }
}
