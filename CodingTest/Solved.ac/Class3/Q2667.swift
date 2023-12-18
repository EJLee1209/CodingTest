//
//  Q2667.swift
//  CodingTest
//
//  Created by 이은재 on 12/18/23.
//https://www.acmicpc.net/problem/2667

import Foundation

struct Q2667: Template {
    static func solution() {
        let n = Int(readLine()!)!
        var board: [[Int]] = []
        for _ in 0..<n {
            board.append(Array(readLine()!).map { Int(String($0))! })
        }
        
        let dx = [-1, 1, 0, 0]
        let dy = [0, 0, -1, 1]
        var checker: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)
        var apartDict: [Int: Int] = [:]
        var count = 0
        
        func dfs(x: Int, y: Int) {
            if apartDict[count] == nil {
                apartDict[count] = 1
            } else {
                apartDict[count]! += 1
            }
            checker[x][y] = count
            
            for i in 0..<4 {
                let nx = x + dx[i]
                let ny = y + dy[i]
                if nx >= 0 && nx < n && ny >= 0 && ny < n && board[nx][ny] == 1 && checker[nx][ny] == 0 {
                    dfs(x: nx, y: ny)
                }
            }
        }
        
        for i in 0..<n {
            for j in 0..<n {
                if board[i][j] == 1 && checker[i][j] == 0 {
                    count += 1
                    dfs(x: i, y: j)
                }
            }
        }
        print(count)
        for (_, value) in apartDict.sorted(by: { $0.value < $1.value }) {
            print(value)
        }
    }
}
