//
//  Q4963.swift
//  CodingTest
//
//  Created by 이은재 on 3/6/24.
//https://www.acmicpc.net/problem/4963

struct Q4963: Template {
    static func solution() {
        let dx = [-1, 1, 0, 0, -1, 1, 1, -1]
        let dy = [0, 0, -1, 1, 1, 1, -1, -1]
        var board: [[Int]]!
        var w: Int!
        var h: Int!
        var visited: [[Bool]]!
        var answer = ""
        
        while true {
            let wh = readLine()!.split(separator: " ").map { Int(String($0))! }
            if wh == [0, 0] { break }
            (w, h) = (wh[0], wh[1])
            board = .init()
            visited = Array(repeating: Array(repeating: false, count: w), count: h)
            
            for _ in 0..<h {
                let row = readLine()!.split(separator: " ").map { Int(String($0))! }
                board.append(row)
            }
            
            var cnt = 0
            for i in 0..<h {
                for j in 0..<w {
                    if board[i][j] == 1 && !visited[i][j] {
                        cnt += 1
                        dfs(x: i, y: j)
                    }
                }
            }
            answer += "\(cnt)\n"
        }
        print(answer)
        
        func dfs(x: Int, y: Int) {
            visited[x][y] = true
            
            for i in 0..<8 {
                let nx = x + dx[i]
                let ny = y + dy[i]
                
                if (0..<h).contains(nx) && (0..<w).contains(ny) && board[nx][ny] == 1 && !visited[nx][ny] {
                    dfs(x: nx, y: ny)
                }
            }
        }
    }
}
