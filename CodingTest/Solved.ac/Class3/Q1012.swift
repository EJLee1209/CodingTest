//
//  Q1012.swift
//  CodingTest
//
//  Created by 이은재 on 12/11/23.
//https://acmicpc.net/problem/1012

import Foundation

struct Q1012: Template {
    struct Queue {
        private var inBox: [(Int, Int)] = []
        private var outBox: [(Int, Int)] = []
        
        var isEmpty: Bool {
            return inBox.isEmpty && outBox.isEmpty
        }
        
        mutating func enqueue(_ value: (Int, Int)) {
            inBox.append(value)
        }
        
        mutating func dequeue() -> (Int, Int)? {
            if outBox.isEmpty {
                outBox.append(contentsOf: inBox.reversed())
                inBox.removeAll()
            }
            
            return outBox.isEmpty ? nil : outBox.removeLast()
        }
    }
    
    static func solution() {
        let t = Int(readLine()!)!
        
        for _ in 0..<t {
            let mnk = readLine()!.split(separator: " ").map { Int($0)! }
            /// n x m 크기의 배추 밭, k개의 배추가 심어져있음
            let (m,n,k) = (mnk[0], mnk[1], mnk[2])
            var board: [[Int]] = Array(repeating: Array(repeating: 0, count: m), count: n)
            
            for _ in 0..<k {
                let xy = readLine()!.split(separator: " ").map { Int($0)! }
                let (x,y) = (xy[0], xy[1])
                board[y][x] = 1
            }
            
            let dx = [-1, 1, 0, 0]
            let dy = [0, 0, -1, 1]
            var queue = Queue()
            var cnt = 0
            
            for i in 0..<n {
                for j in 0..<m {
                    if board[i][j] == 1 {
                        cnt += 1
                        queue.enqueue((i, j))
                        while !queue.isEmpty {
                            let currentPos = queue.dequeue()!
                            let (x, y) = (currentPos.0, currentPos.1)
                            board[x][y] = 0
                            
                            for s in 0..<4 {
                                let nx = x + dx[s]
                                let ny = y + dy[s]
                                
                                if nx >= 0 && nx < n && ny >= 0 && ny < m && board[nx][ny] == 1 {
                                    board[nx][ny] = 0
                                    queue.enqueue((nx, ny))
                                }
                            }
                        }
                        
                    }
                        
                }
            }
            print(cnt)
        }
    }
}
