//
//  Q2096.swift
//  CodingTest
//
//  Created by 이은재 on 1/20/24.
//https://www.acmicpc.net/problem/2096

struct Q2096: Template {
    static func solution() {
        let n = Int(readLine()!)!
        var board: [[Int]] = []
        for _ in 0..<n {
            board.append([0] + readLine()!.split(separator: " ").map { Int(String($0))! } + [0])
        }
        let INF = Int.max / 2
        var maxDp = Array(repeating: Array(repeating: 0, count: 5), count: n)
        var minDp = Array(repeating: Array(repeating: INF, count: 5), count: n)
        
        (1...3).forEach { i in
            maxDp[0][i] = board[0][i]
            minDp[0][i] = board[0][i]
        }
        
        for i in 1..<n {
            for j in 1...3 {
                maxDp[i][j] = max(maxDp[i - 1][j - 1], maxDp[i - 1][j], maxDp[i - 1][j + 1]) + board[i][j]
                minDp[i][j] = min(minDp[i - 1][j - 1], minDp[i - 1][j], minDp[i - 1][j + 1]) + board[i][j]
            }
        }
        
        print(maxDp.last!.max()!, minDp.last!.min()!)
    }
}
