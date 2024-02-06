//
//  Q17070.swift
//  CodingTest
//
//  Created by 이은재 on 2/6/24.
//https://www.acmicpc.net/problem/17070

struct Q17070: Template {
    enum Pipe {
        case horizon(x: Int, y: Int)
        case vertical(x: Int, y: Int)
        case angle(x: Int, y: Int)
        
        var nextPipes: [Self] {
            var pipes = [Self]()
            switch self {
            case .horizon(let x, let y):
                pipes = [
                    Pipe.horizon(x: x, y: y + 1),
                    Pipe.angle(x: x + 1, y: y + 1)
                ]
            case .vertical(let x, let y):
                pipes = [
                    Pipe.vertical(x: x + 1, y: y),
                    Pipe.angle(x: x + 1, y: y + 1)
                ]
            case .angle(let x, let y):
                pipes = [
                    Pipe.horizon(x: x, y: y + 1),
                    Pipe.vertical(x: x + 1, y: y),
                    Pipe.angle(x: x + 1, y: y + 1),
                ]
            }
            return pipes
        }
        
        func checkRoute(routes: [[Int]]) -> Bool {
            switch self {
            case .horizon(let x, let y):
                return routes[x][y] == 0
            case .vertical(let x, let y):
                return routes[x][y] == 0
            case .angle(let x, let y):
                return routes[x][y] == 0 && routes[x - 1][y] == 0 && routes[x][y - 1] == 0
            }
        }
    }
    
    static func solution() {
        let n = Int(readLine()!)!
        var board: [[Int]] = []
        for _ in 0..<n {
            board.append(readLine()!.split(separator: " ").map { Int(String($0))! })
        }
        var answer = 0
        if board[n - 1][n - 1] == 0 {
            dfs(pipe: Pipe.horizon(x: 0, y: 1))
        }
        print(answer)
        
        func dfs(pipe: Pipe) {
            switch pipe {
            case let .angle(x, y), let .horizon(x, y), let .vertical(x, y):
                if x >= n || y >= n {
                    return
                }
                
                if !pipe.checkRoute(routes: board) {
                    return
                }
                
                if x == n - 1 && y == n - 1 {
                    answer += 1
                    return
                }
            }

            for nextPipe in pipe.nextPipes {
                dfs(pipe: nextPipe)
            }
        }
        
    }
}
