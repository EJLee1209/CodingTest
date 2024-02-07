//
//  Q11404.swift
//  CodingTest
//
//  Created by 이은재 on 2/7/24.
//https://www.acmicpc.net/problem/11404

struct Q11404: Template {
    
    static func solution() {
        let n = Int(readLine()!)!
        let m = Int(readLine()!)!
        let INF = Int.max / 2
        var board = Array(repeating: Array(repeating: INF, count: n + 1), count: n + 1)
        (1...n).forEach { board[$0][$0] = 0 }
        
        for _ in 0..<m {
            let input = readLine()!.split(separator: " ").map { Int(String($0))! }
            board[input[0]][input[1]] = min(input[2], board[input[0]][input[1]])
        }
        
        for k in 1...n {
            for i in 1...n {
                for j in 1...n {
                    board[i][j] = min(board[i][j], board[i][k] + board[k][j])
                }
            }
        }
        
        for i in 1...n {
            for j in 1...n {
                print(board[i][j] < INF ? board[i][j] : 0, terminator: " ")
            }
            print()
        }
        
    }
}
