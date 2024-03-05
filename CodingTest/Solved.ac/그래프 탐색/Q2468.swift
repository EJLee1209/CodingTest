//
//  Q2468.swift
//  CodingTest
//
//  Created by 이은재 on 3/5/24.
//https://www.acmicpc.net/problem/2468

struct Q2468: Template {
    static func solution() {
        let n = Int(readLine()!)!
        var board = [[Int]]()
        let dx = [-1, 1, 0, 0]
        let dy = [0, 0, -1, 1]
        var answer = 0
        for _ in 0..<n {
            let row = readLine()!.split(separator: " ").map { Int(String($0))! }
            board.append(row)
        }
        
        var visited: [[Bool]]!
        var height: Int!
        for k in 0...100 {
            var cnt = 0
            visited = Array(repeating: Array(repeating: false, count: n), count: n)
            height = k
            for i in 0..<n {
                for j in 0..<n {
                    if board[i][j] > height && !visited[i][j] {
                        cnt += 1
                        dfs(x: i, y: j)
                    }
                }
            }
            answer = max(answer, cnt)
        }
        print(answer)
        
        func dfs(x: Int, y: Int) {
            visited[x][y] = true
            
            for i in 0..<4 {
                let nx = x + dx[i]
                let ny = y + dy[i]
                
                if (0..<n).contains(nx) && (0..<n).contains(ny) && board[nx][ny] > height && !visited[nx][ny] {
                    dfs(x: nx, y: ny)
                }
            }
        }
    }
}
