//
//  Q2638.swift
//  CodingTest
//
//  Created by 이은재 on 1/22/24.
//https://www.acmicpc.net/problem/2638

struct Q2638: Template {
    static func solution() {
        let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
        let (N, M) = (NM[0], NM[1])
        var board = [[Int]]()
        var cheezes = [(Int, Int)]()
        
        for i in 0..<N {
            let row = readLine()!.split(separator: " ").map { Int(String($0))! }
            for j in 0..<M where row[j] == 1 {
                cheezes.append((i, j))
            }
            board.append(row)
        }
        
        var outer: [[Bool]] = []
        let dx = [-1, 1, 0, 0]
        let dy = [0, 0, -1, 1]
        
        var hour = 0
        while !cheezes.isEmpty {
            hour += 1
            findOuter()
            melting()
        }
        
        print(hour)
        
        func findOuter() {
            outer = Array(repeating: Array(repeating: false, count: M), count: N)
            var queue = [(Int, Int)]()
            queue.append((0, 0))
            outer[0][0] = true
            
            var front = 0
            while queue.count > front {
                let curPos = queue[front]
                let (x, y) = (curPos.0, curPos.1)
                front += 1
                
                for i in 0..<4 {
                    let nx = x + dx[i]
                    let ny = y + dy[i]
                    
                    if (0..<N).contains(nx) && (0..<M).contains(ny) && board[nx][ny] == 0 && !outer[nx][ny] {
                        outer[nx][ny] = true
                        queue.append((nx, ny))
                    }
                }
            }
        }
        
        func melting() {
            var tempList = cheezes
            cheezes.removeAll()
            
            for (x, y) in tempList {
                
                var numberOfOuter = 0
                
                for i in 0..<4 {
                    let nx = x + dx[i]
                    let ny = y + dy[i]
                    
                    if outer[nx][ny] {
                        numberOfOuter += 1
                    }
                }
                
                if numberOfOuter < 2 {
                    cheezes.append((x, y))
                } else {
                    board[x][y] = 0
                }
            }
        }
        
        
    }
}
