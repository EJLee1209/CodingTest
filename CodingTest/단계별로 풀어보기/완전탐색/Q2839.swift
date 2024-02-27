//
//  Q2839.swift
//  CodingTest
//
//  Created by 이은재 on 11/22/23.
//

import Foundation

struct Q2839: Template {
    static func solution() {
        let n = Int(readLine()!)!
        var result = -1
        
        for i in 0...(n/5) {
            let tmp = n - (i * 5)
            if tmp % 3 == 0 {
                result = (tmp / 3) + i
            }
        }
        print(result)
 
        // dp 풀이
//        let INF = Int.max / 2
//        let n = Int(readLine()!)!
//        var dp = Array(repeating: INF, count: n + 1)
//        var baskets = [3, 5]
//        dp[0] = 0
//
//        for basket in baskets where basket <= n {
//            for j in basket...n {
//                dp[j] = min(dp[j - basket] + 1, dp[j])
//            }
//        }
//
//        print(dp[n] == INF ? -1 : dp[n])
    }
}
