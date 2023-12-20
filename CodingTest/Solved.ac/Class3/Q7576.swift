//
//  Q7576.swift
//  CodingTest
//
//  Created by 이은재 on 12/20/23.
//https://www.acmicpc.net/problem/7576

import Foundation

struct Q7576: Template {
    struct Queue {
        typealias ValueType = (x: Int, y: Int)
        private var inBox: [ValueType] = []
        private var outBox: [ValueType] = []
        
        var count: Int { return inBox.count + outBox.count }
        var isEmpty: Bool { return inBox.isEmpty && outBox.isEmpty }
        
        mutating func enqueue(_ value: ValueType) { inBox.append(value) }
        
        mutating func dequeue() -> ValueType? {
            if outBox.isEmpty {
                outBox.append(contentsOf: inBox.reversed())
                inBox = []
            }
            
            return outBox.isEmpty ? nil : outBox.removeLast()
        }
    }
    
    static func solution() {
        let mn = readLine()!.split(separator: " ").map { Int(String($0))! }
        let (m, n) = (mn[0], mn[1])
        var board: [[Int]] = []
        
        for _ in 0..<n {
            board.append(readLine()!.split(separator: " ").map { Int(String($0))! })
        }
        
        let dx = [-1,1,0,0]
        let dy = [0,0,-1,1]
        var queue = Queue()
        for i in 0..<n {
            for j in 0..<m {
                if board[i][j] == 1 { queue.enqueue((i,j)) }
            }
        }
        
        var result = -1
        while !queue.isEmpty {
            for _ in 0..<queue.count {
                let curPos = queue.dequeue()!
                
                for i in 0..<4 {
                    let nx = curPos.x + dx[i]
                    let ny = curPos.y + dy[i]
                    
                    if nx >= 0 && nx < n && ny >= 0 && ny < m && board[nx][ny] == 0 {
                        board[nx][ny] = 1
                        queue.enqueue((nx,ny))
                    }
                }
            }
            result += 1
        }
        
        var flag = true
        for i in 0..<n {
            for j in 0..<m {
                if board[i][j] == 0 { 
                    flag = false
                    break
                }
            }
            if !flag { break }
        }
        print(flag ? result : -1)
    }
}
