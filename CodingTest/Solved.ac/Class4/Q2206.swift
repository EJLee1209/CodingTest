//
//  Q2206.swift
//  CodingTest
//
//  Created by 이은재 on 1/21/24.
//https://www.acmicpc.net/problem/2206

struct Q2206: Template {
    
    struct Position {
        let x: Int
        let y: Int
        var wall: Int
    }
    
    struct Queue<T> {
        private var queue = [T]()
        private var front = 0
        
        var isEmpty: Bool { front >= queue.count }
        
        mutating func append(_ value: T) {
            queue.append(value)
        }
        
        mutating func removeFirst() -> T? {
            if isEmpty { return nil }
            
            defer {
                front += 1
            }
            
            return queue[front]
        }
    }
    
    static func solution() {
        let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
        let (N, M) = (nm[0], nm[1])
        var board: [[Int]] = []
        for _ in 0..<N {
            board.append(Array(readLine()!).map { Int(String($0))! })
        }
        
        print(bfs())
        
        func bfs() -> Int {
            let dx = [-1, 1, 0, 0]
            let dy = [0, 0, -1, 1]
            
            var dist = Array(repeating: Array(repeating: [0, 0], count: M), count: N)
            dist[0][0][0] = 1
            
            var queue = Queue<Position>()
            queue.append(Position(x: 0, y: 0, wall: 0))
            
            while !queue.isEmpty {
                let curPos = queue.removeFirst()!
                let (x, y, wall) = (curPos.x, curPos.y, curPos.wall)
                
                if x == N - 1 && y == M - 1 {
                    return dist[x][y][wall]
                }
                
                for i in 0..<4 {
                    let nx = x + dx[i]
                    let ny = y + dy[i]
                    
                    if (0..<N).contains(nx) && (0..<M).contains(ny) {
                        if board[nx][ny] == 1 && wall == 0 {
                            dist[nx][ny][1] = dist[x][y][wall] + 1
                            queue.append(Position(x: nx, y: ny, wall: 1))
                        } else if board[nx][ny] == 0 && dist[nx][ny][wall] == 0 {
                            dist[nx][ny][wall] = dist[x][y][wall] + 1
                            queue.append(Position(x: nx, y: ny, wall: wall))
                        }
                        
                    }
                }
            }
            
            return -1
        }
    }
}
