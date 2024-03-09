//
//  Q11055.swift
//  CodingTest
//
//  Created by 이은재 on 3/9/24.
//

struct Q11055: Template {
    static func solution() {
        let n = Int(readLine()!)!
        let A = readLine()!.split(separator: " ").map { Int(String($0))! }
        var dp = Array(repeating: 0, count: n)
        dp[0] = A[0]
        
        for i in 1..<n {
            dp[i] = A[i]
            
            for j in 0..<i where A[i] > A[j] {
                dp[i] = max(dp[i], dp[j] + A[i])
            }
        }
        print(dp.max()!)
    }
}
