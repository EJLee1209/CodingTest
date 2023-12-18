//
//  Q2579.swift
//  CodingTest
//
//  Created by 이은재 on 12/17/23.
//https://www.acmicpc.net/problem/2579

import Foundation

struct Q2579: Template {
    static func solution() {
        let n = Int(readLine()!)!
        var arr: [Int] = [0]
        for _ in 0..<n { arr.append(Int(readLine()!)!) }

        /// 두번째 접근방법(DP)
        /// 첫번째 계단에 오르기 위한 점수의 최댓값: 첫번째 계단의 점수
        /// 두번째 계단에 오르기 위한 점수의 최댓값: 첫번째 + 두번째 계단의 점수
        /// 세번재 계단에 오르기 위한 점수의 최댓값: max(첫번째 계단 + 세번째 계단, 두번재 계단 + 세번째 계단)
        /// 네번째 계단에 오르기 위한 점수의 최댓값: max(첫번째 계단 + 세번째 계단 + 네번째 계단, 두번째 계단 + 네번째 계단)
        /// ...
        /// i번째 계단에 오르기 위한 점수의 최댓값: max(i-3번째 계단 + i-1번째 계단 + i번째 계단, i-2번째 계단 + i번째 계단)
        /// 위 아이디어를 토대로 점화식 도출
        
        var dp: [Int] = Array(repeating: 0, count: n + 1)
        
        if n == 1 {
            print(arr[1])
        } else if n == 2 {
            print(arr[1] + arr[2])
        } else {
            dp[1] = arr[1]
            dp[2] = arr[1] + arr[2]
            
            for i in 3...n {
                dp[i] = max(dp[i-3] + arr[i-1], dp[i-2]) + arr[i]
            }
            
            print(dp.last!)
        }
        
        
        
        /// 첫번째 접근방법 (DFS) - 시간초과
//        var result = 0
//        /// x: 출발지점, c: 연속된 수, s: 점수 총 합
//        func dfs(_ x: Int, _ c: Int, _ s: Int) {
//            if x == n {
//                result = max(result, s)
//                return
//            }
//            
//            if x + 1 <= n && c <= 1 {
//                dfs(x+1,c+1,s+arr[x+1])
//            }
//            if x + 2 <= n {
//                dfs(x+2,1,s+arr[x+2])
//            }
//        }
//        dfs(0,0,0)
//        print(result)
    }
}
