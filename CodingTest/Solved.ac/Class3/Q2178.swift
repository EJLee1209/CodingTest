//
//  Q2178.swift
//  CodingTest
//
//  Created by 이은재 on 12/17/23.
//

import Foundation

struct Q2178: Template {
    
    static func solution() {        
        let nm = readLine()!.split(separator: " ").map { Int($0)! }
        let (n,m) = (nm[0],nm[1])
        var board: [[Int]] = []
        
        for _ in 0..<n {
            board.append(Array(readLine()!).map { Int(String($0))! })
        }
        
        let dx = [-1, 1, 0, 0]
        let dy = [0, 0, -1, 1]
        var queue: [(Int,Int)] = []
        var distance: [[Int]] = Array(repeating: Array(repeating: 0, count: m), count: n)
        queue.append((0,0))
        distance[0][0] = 1
        
        while !queue.isEmpty {
            let curXY = queue.removeFirst()
            let (x,y) = (curXY.0, curXY.1)
            for i in 0..<4 {
                let nx = x + dx[i]
                let ny = y + dy[i]
                if nx >= 0 && nx < n && ny >= 0 && ny < m && board[nx][ny] == 1 && distance[nx][ny] == 0 {
                    distance[nx][ny] = distance[x][y] + 1
                    queue.append((nx,ny))
                }
            }
        }
        print(distance[n-1][m-1])
    }
}
