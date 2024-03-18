//
//  Q2583.swift
//  CodingTest
//
//  Created by 이은재 on 3/18/24.
////https://www.acmicpc.net/problem/2583

import Foundation

struct Q2583: Template {
    static func solution() {
        let mnk = readLine()!.split(separator: " ").map { Int(String($0))! }
        let (m, n, k) = (mnk[0], mnk[1], mnk[2])
        var board = Array(repeating: Array(repeating: 0, count: n), count: m)
        var visited = Array(repeating: Array(repeating: false, count: n), count: m)
        var cnt = 0
        var sizes = [Int]()
        let dx = [-1, 1, 0, 0]
        let dy = [0, 0, -1, 1]
        
        for _ in 0..<k {
            let input = readLine()!.split(separator: " ").map { Int(String($0))! }
            let (x1, y1, x2, y2) = (input[0], input[1], input[2], input[3])
            
            for i in y1..<y2 {
                for j in x1..<x2 {
                    board[i][j] = 1
                }
            }
        }
        
        for i in 0..<m {
            for j in 0..<n {
                if board[i][j] == 0 && !visited[i][j] {
                    let size = bfs(x: i, y: j)
                    sizes.append(size)
                    cnt += 1
                }
            }
        }
        
        print(cnt)
        print(sizes.sorted().map { String($0) }.joined(separator: " "))
        
        func bfs(x: Int, y: Int) -> Int {
            visited[x][y] = true
            var size = 0
            var queue = [(x, y)]
            var front = 0
            
            while queue.count > front {
                let (x, y) = queue[front]
                front += 1
                size += 1
                
                for i in 0..<4 {
                    let nx = x + dx[i]
                    let ny = y + dy[i]
                    
                    if (0..<m).contains(nx) && (0..<n).contains(ny) && !visited[nx][ny] && board[nx][ny] == 0 {
                        queue.append((nx, ny))
                        visited[nx][ny] = true
                    }
                }
            }
            
            return size
        }
    }
}
