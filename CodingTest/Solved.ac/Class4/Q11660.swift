//
//  Q11660.swift
//  CodingTest
//
//  Created by 이은재 on 1/29/24.
//https://www.acmicpc.net/problem/11660

struct Q11660: Template {
    static func solution() {
        let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
        let (n, m) = (nm[0], nm[1])
        var board: [[Int]] = Array(repeating: Array(repeating: 0, count: n + 1), count: 1)
        
        for _ in 0..<n {
            let row = readLine()!.split(separator: " ").map { Int(String($0))! }
            board.append([0] + row)
        }
        
        var boardSum = Array(repeating: Array(repeating: 0, count: n + 1), count: n + 1)
        
        for i in 1...n {
            for j in 1...n {
                boardSum[i][j] = boardSum[i - 1][j] + boardSum[i][j - 1] - boardSum[i - 1][j - 1] + board[i][j]
            }
        }
        
        var answers = [Int]()
        for _ in 0..<m {
            let input = readLine()!.split(separator: " ").map { Int(String($0))! }
            let (x1, y1, x2, y2) = (input[0], input[1], input[2], input[3])
            let sum = boardSum[x2][y2] - (boardSum[x2][y1 - 1] + boardSum[x1 - 1][y2] - boardSum[x1 - 1][y1 - 1])
            answers.append(sum)
        }
        for answer in answers {
            print(answer)
        }
    }
}
