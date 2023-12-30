//
//  Q10026.swift
//  CodingTest
//
//  Created by 이은재 on 12/29/23.
//https://www.acmicpc.net/problem/10026

import Foundation

struct Q10026: Template {
    static func solution() {
        typealias Position = (x: Int, y: Int)
        
        struct Queue {
            private var queue: [Position] = []
            private var front = 0
            
            var isEmpty: Bool { return front >= queue.count }
            
            mutating func insert(_ value: Position) {
                queue.append(value)
            }
            
            mutating func popFront() -> Position {
                defer {
                    front += 1
                }
                return queue[front]
            }
            
        }
        
        let n = Int(readLine()!)!
        var board: [[String]] = []
        for _ in 0..<n {
            let row = Array(readLine()!).map { String($0) }
            board.append(row)
        }
        let dx = [-1, 1, 0, 0]
        let dy = [0, 0, -1, 1]
        var checker1: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)
        var checker2: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: n)
        var cnt1 = 0
        var cnt2 = 0
        
        for i in 0..<n {
            for j in 0..<n {
                if checker1[i][j] == 0 {
                    cnt1 += 1
                    bfs(i, j, false)
                }
                
                if checker2[i][j] == 0 {
                    cnt2 += 1
                    bfs(i, j, true)
                }
            }
        }
        
        print(cnt1, cnt2)
        
        func bfs(_ i: Int, _ j: Int, _ option: Bool) {
            var queue = Queue()
            queue.insert((i, j))
            
            if option { checker2[i][j] = 1 }
            else { checker1[i][j] = 1 }
            
            while !queue.isEmpty {
                let curPos = queue.popFront()
                
                for k in 0..<4 {
                    let nx = curPos.x + dx[k]
                    let ny = curPos.y + dy[k]
                    if option {
                        if nx >= 0 && nx < n && ny >= 0 && ny < n && checker2[nx][ny] == 0 && (board[nx][ny] == board[i][j] || (board[nx][ny] == "R" && board[i][j] == "G" || board[nx][ny] == "G" && board[i][j] == "R")) {
                            queue.insert((nx, ny))
                            checker2[nx][ny] = cnt2
                        }
                    } else {
                        if nx >= 0 && nx < n && ny >= 0 && ny < n && checker1[nx][ny] == 0 && board[nx][ny] == board[i][j] {
                            queue.insert((nx, ny))
                            checker1[nx][ny] = cnt1
                        }
                    }
                }
            }
        }
        
    }
}
