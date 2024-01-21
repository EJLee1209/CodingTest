//
//  Q1600.swift
//  CodingTest
//
//  Created by 이은재 on 1/21/24.
//https://www.acmicpc.net/problem/1600

struct Q1600: Template {
    
    struct Monkey {
        let x: Int
        let y: Int
        var moveLikeHorse: Int
    }
    
    struct Queue<T> {
        private var queue = [T]()
        private var front = 0
        
        var isEmpty: Bool { front >= queue.count }
        
        mutating func enqueue(_ value: T) {
            queue.append(value)
        }
        
        mutating func dequeue() -> T? {
            if isEmpty { return nil }
            defer { front += 1 }
            return queue[front]
        }
    }
    
    static func solution() {
        let K = Int(readLine()!)!
        let WH = readLine()!.split(separator: " ").map { Int(String($0))! }
        let (W, H) = (WH[0], WH[1])
        var board: [[Int]] = []
        
        for _ in 0..<H {
            board.append(readLine()!.split(separator: " ").map { Int(String($0))! })
        }
        
        print(dfs())
        
        func dfs() -> Int {
            let normalDx = [-1, 1, 0, 0]
            let normalDy = [0, 0, -1, 1]
            let horseDx = [-2, -1, 1, 2, 2, 1, -1, -2]
            let horseDy = [1, 2, 2, 1, -1, -2, -2, -1]
            
            var dist = Array(repeating: Array(repeating: Array(repeating: 0, count: K + 1), count: W), count: H)
            var queue = Queue<Monkey>()
            queue.enqueue(Monkey(x: 0, y: 0, moveLikeHorse: 0))
            
            while !queue.isEmpty {
                let monkey = queue.dequeue()!
                let (x, y, moveLikeHorse) = (monkey.x, monkey.y, monkey.moveLikeHorse)
                
                if x == H - 1 && y == W - 1 {
                    return dist[x][y][moveLikeHorse]
                }
                
                if moveLikeHorse < K {
                    // 말의 움직임
                    for i in 0..<8 {
                        let nx = x + horseDx[i]
                        let ny = y + horseDy[i]
                        
                        if (0..<H).contains(nx) && (0..<W).contains(ny)
                            && board[nx][ny] == 0 &&
                            dist[nx][ny][moveLikeHorse + 1] == 0
                        {
                            dist[nx][ny][moveLikeHorse + 1] = dist[x][y][moveLikeHorse] + 1
                            queue.enqueue(Monkey(x: nx, y: ny, moveLikeHorse: moveLikeHorse + 1))
                        }
                    }
                }
                for i in 0..<4 {
                    let nx = x + normalDx[i]
                    let ny = y + normalDy[i]
                    
                    if (0..<H).contains(nx) && (0..<W).contains(ny) &&
                        board[nx][ny] == 0 &&
                        dist[nx][ny][moveLikeHorse] == 0 {
                        dist[nx][ny][moveLikeHorse] = dist[x][y][moveLikeHorse] + 1
                        queue.enqueue(Monkey(x: nx, y: ny, moveLikeHorse: moveLikeHorse))
                    }
                }
            }
            
            return -1
        }
        
    }
}
