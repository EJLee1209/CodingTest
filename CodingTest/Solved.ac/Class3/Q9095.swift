//
//  Q9095.swift
//  CodingTest
//
//  Created by 이은재 on 12/20/23.
//

import Foundation

struct Q9095: Template {
    static func solution() {
        /// 점화식을 사용해서 dynamic programming 으로 접근
        let t = Int(readLine()!)!
        for _ in 0..<t {
            let n = Int(readLine()!)!
            var dp: [Int] = Array(repeating: 0, count: 11)
            dp[1] = 1
            dp[2] = 2
            dp[3] = 4
            
            if n >= 4 {
                for i in 4...n {
                    dp[i] = dp[i-3..<i].reduce(0, +)
                }
            }
            print(dp[n])
        }
        /// dfs 로 모든 경우의 수를 탐색하는 방법
//        let t = Int(readLine()!)!
//        for _ in 0..<t {
//            let n = Int(readLine()!)!
//            
//            var cnt = 0
//            dfs(n, 0, &cnt)
//            
//            print(cnt)
//        }
//        
//        func dfs(_ targetNumber: Int, _ totalSum: Int, _ caseCount: inout Int) {
//            if totalSum > targetNumber { return }
//            if totalSum == targetNumber {
//                caseCount += 1
//                return
//            }
//            dfs(targetNumber, totalSum + 1, &caseCount)
//            dfs(targetNumber, totalSum + 2, &caseCount)
//            dfs(targetNumber, totalSum + 3, &caseCount)
//        }
    }
}
