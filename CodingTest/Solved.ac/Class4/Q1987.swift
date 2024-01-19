//
//  Q1987.swift
//  CodingTest
//
//  Created by 이은재 on 1/19/24.
//https://www.acmicpc.net/problem/1987

struct Q1987: Template {
    
    static func solution() {
        let RC = readLine()!.split(separator: " ").map { Int(String($0))! }
        let (R, C) = (RC[0], RC[1])
        var board: [[Int]] = []
        
        for _ in 0..<R {
            let row = readLine()!.map { Int($0.asciiValue!) - 65 }
            board.append(row)
        }
        
        let dx = [-1, 1, 0, 0]
        let dy = [0, 0, -1, 1]
        
        var result = 0
        
        dfs(x: 0, y: 0, count: 1, bit: 1 << board[0][0])
        print(result)
        
        func dfs(x: Int, y: Int, count: Int, bit: Int) {
            for i in 0..<4 {
                let nx = x + dx[i]
                let ny = y + dy[i]
                
                if (0..<R).contains(nx) && (0..<C).contains(ny) {
                    let newBit = 1 << board[nx][ny]
                    if bit & newBit == 0 {
                        dfs(x: nx, y: ny, count: count + 1, bit: bit | newBit)
                    }
                }
            }
            
            result = max(result, count)
        }
    }
}

