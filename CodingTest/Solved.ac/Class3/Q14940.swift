//
//  Q14940.swift
//  CodingTest
//
//  Created by 이은재 on 12/22/23.
//https://www.acmicpc.net/problem/14940

import Foundation

struct Q14940: Template {
    struct Queue {
        typealias ValueType = (x: Int, y: Int)
        private var inBox: [ValueType] = []
        private var outBox: [ValueType] = []
        
        var isEmpty: Bool { return inBox.isEmpty && outBox.isEmpty }
        
        mutating func enqueue(_ value: ValueType) { inBox.append(value) }
        
        mutating func dequeue() -> ValueType? {
            if outBox.isEmpty {
                outBox.append(contentsOf: inBox.reversed())
                inBox.removeAll()
            }
            
            return outBox.isEmpty ? nil : outBox.removeLast()
        }
    }
    
    static func solution() {
        let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
        let (n, m) = (nm[0], nm[1])
        var board: [[Int]] = []
        var distance: [[Int]] = Array(repeating: Array(repeating: 0, count: m), count: n)
        let dx = [-1,1,0,0]
        let dy = [0,0,-1,1]
        var queue = Queue()
        var startPos = (0, 0)
        
        for i in 0..<n {
            let row = readLine()!.split(separator: " ").map { Int(String($0))! }
            if queue.isEmpty {
                for j in 0..<m {
                    if row[j] == 2 {
                        queue.enqueue((i,j))
                        startPos = (i, j)
                        break
                    }
                }
            }
            board.append(row)
        }
        
        while !queue.isEmpty {
            let curPos = queue.dequeue()!
            for i in 0..<4 {
                let nx = curPos.x + dx[i]
                let ny = curPos.y + dy[i]
                if nx >= 0 && nx < n && ny >= 0 && ny < m && board[nx][ny] == 1 && distance[nx][ny] == 0 {
                    queue.enqueue((nx,ny))
                    distance[nx][ny] = distance[curPos.x][curPos.y] + 1
                }
            }
        }
        
        for i in 0..<n {
            for j in 0..<m {
                if board[i][j] == 0 {
                    print(0, terminator: " ")
                }
                else if (i, j) != startPos && distance[i][j] == 0 {
                    print(-1, terminator: " ")
                } else {
                    print(distance[i][j], terminator: " ")
                }
            }
            print()
        }
    }
}

