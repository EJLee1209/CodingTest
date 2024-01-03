//
//  Q14500.swift
//  CodingTest
//
//  Created by 이은재 on 1/2/24.
//https://www.acmicpc.net/problem/14500

import Foundation

struct Q14500: Template{
    static func solution() {
        let dx = [[0,0,0], [1,1,0], [1,2,2], [1,1,2], [0,0,1]]
        let dy = [[1,2,3], [0,1,1], [0,0,1], [0,1,1], [1,2,1]]
        
        let nm = readLine()!.split(separator: " ").map { Int($0)! }
        let (n, m) = (nm[0], nm[1])
        
        var board: [[Int]] = []
        for _ in 0..<n {
            board.append(readLine()!.split(separator: " ").map { Int($0)! })
        }
        
        var result = 0
        for i in 0..<n {
            for j in 0..<m {
                for k in 0..<5 {
                    var sum = board[i][j]
                    for s in 0..<3 {
                        let nx = i + dx[k][s]
                        let ny = j + dy[k][s]
                        
                        if nx >= 0 && nx < n && ny >= 0 && ny < m {
                            sum += board[nx][ny]
                        }
                    }
                    result = max(result, sum)
                    
                    sum = board[i][j]
                    for s in 0..<3 {
                        let nx = i - dy[k][s]
                        let ny = j + dx[k][s]
                        
                        if nx >= 0 && nx < n && ny >= 0 && ny < m {
                            sum += board[nx][ny]
                        }
                    }
                    result = max(result, sum)
                    
                    sum = board[i][j]
                    for s in 0..<3 {
                        let nx = i - dx[k][s]
                        let ny = j - dy[k][s]
                        
                        if nx >= 0 && nx < n && ny >= 0 && ny < m {
                            sum += board[nx][ny]
                        }
                    }
                    result = max(result, sum)
                    
                    sum = board[i][j]
                    for s in 0..<3 {
                        let nx = i + dy[k][s]
                        let ny = j - dx[k][s]
                        
                        if nx >= 0 && nx < n && ny >= 0 && ny < m {
                            sum += board[nx][ny]
                        }
                    }
                    result = max(result, sum)
                    
                    sum = board[i][j]
                    for s in 0..<3 {
                        let nx = i + dx[k][s]
                        let ny = j - dy[k][s]
                        
                        if nx >= 0 && nx < n && ny >= 0 && ny < m {
                            sum += board[nx][ny]
                        }
                    }
                    result = max(result, sum)
                    
                    sum = board[i][j]
                    for s in 0..<3 {
                        let nx = i + dy[k][s]
                        let ny = j + dx[k][s]
                        
                        if nx >= 0 && nx < n && ny >= 0 && ny < m {
                            sum += board[nx][ny]
                        }
                    }
                    result = max(result, sum)
                    
                    sum = board[i][j]
                    for s in 0..<3 {
                        let nx = i - dx[k][s]
                        let ny = j + dy[k][s]
                        
                        if nx >= 0 && nx < n && ny >= 0 && ny < m {
                            sum += board[nx][ny]
                        }
                    }
                    result = max(result, sum)
                    
                    sum = board[i][j]
                    for s in 0..<3 {
                        let nx = i - dy[k][s]
                        let ny = j - dx[k][s]
                        
                        if nx >= 0 && nx < n && ny >= 0 && ny < m {
                            sum += board[nx][ny]
                        }
                    }
                    result = max(result, sum)
                }
            }
        }
        
        print(result)
    }
}
