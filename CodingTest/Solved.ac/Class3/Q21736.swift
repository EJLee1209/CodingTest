//
//  Q21736.swift
//  CodingTest
//
//  Created by 이은재 on 1/5/24.
//https://www.acmicpc.net/problem/21736

import Foundation

struct Q21736: Template {
    static func solution() {
        let nm = readLine()!.split(separator: " ").map { Int($0)! }
        let (n, m) = (nm[0], nm[1])
        var board = [[String]]()
        var startX = 0
        var startY = 0
        for i in 0..<n {
            let row = readLine()!.map { String($0) }
            for j in 0..<m {
                if row[j] == "I" {
                    startX = i
                    startY = j
                }
            }
            
            board.append(row)
        }
        let dx = [-1, 1, 0, 0]
        let dy = [0, 0, -1, 1]
        
        var result = 0
        var visited = Array(repeating: Array(repeating: false, count: m), count: n)
        visited[startX][startY] = true
        
        func dfs(_ x: Int, _ y: Int) {
            if board[x][y] == "P" {
                result += 1
            }
            
            for i in 0..<4 {
                let nx = x + dx[i]
                let ny = y + dy[i]
                if nx >= 0 && nx < n && ny >= 0 && ny < m && !visited[nx][ny] && board[nx][ny] != "X" {
                    visited[nx][ny] = true
                    dfs(nx, ny)
                }
            }
        }
        dfs(startX, startY)
        print(result == 0 ? "TT" : result)
        
    }
}
