//
//  Q17144.swift
//  CodingTest
//
//  Created by 이은재 on 2/9/24.
//
import Foundation

struct Q17144: Template {
    static func solution() {
        let dx = [-1, 1, 0, 0]
        let dy = [0, 0, -1, 1]
        let rct = readLine()!.split(separator: " ").map { Int(String($0))! }
        let (r, c, t) = (rct[0], rct[1], rct[2])
        var board = [[Int]]()
        var top = -1
        var bottom = -1
        
        for i in 0..<r {
            let row = readLine()!.split(separator: " ").map { Int(String($0))! }
            if row.first == -1 && top == -1 {
                top = i
                bottom = i + 1
            }
            board.append(row)
        }
        
        for _ in 0..<t {
            board = dustSpread()
            airCleaner()
        }
        
        var answer = 0
        for row in board {
            for v in row where v > 0 {
                answer += v
            }
        }
        print(answer)
        
        func dustSpread() -> [[Int]] {
            var tmp = board
            let dustLocations = dusts() // r * c
            
            for (x, y) in dustLocations {
                let spreadValue = board[x][y] / 5
                
                for i in 0..<4 {
                    let nx = x + dx[i]
                    let ny = y + dy[i]
                    
                    if (0..<r).contains(nx) && (0..<c).contains(ny) && board[nx][ny] != -1 {
                        tmp[nx][ny] += spreadValue
                        tmp[x][y] -= spreadValue
                    }
                }
            }
            return tmp
        }
        func dusts() -> [(x: Int, y: Int)] {
            var tmp = [(Int, Int)]()
            
            for i in 0..<r {
                for j in 0..<c where board[i][j] >= 5 {
                    tmp.append((i, j))
                }
            }
            return tmp
        }
        
        func airCleaner() {
            executeTop()
            executeBottom()
            
            func executeTop() {
                var x = top - 1
                var y = 0
                
                while x > 0 {
                    board[x][y] = board[x - 1][y]
                    x -= 1
                }
                
                while y < c - 1 {
                    board[x][y] = board[x][y + 1]
                    y += 1
                }
                
                while x < top {
                    board[x][y] = board[x + 1][y]
                    x += 1
                }
                
                while y > 1 {
                    board[x][y] = board[x][y - 1]
                    board[x][y - 1] = 0
                    y -= 1
                }
            }
            
            func executeBottom() {
                var x = bottom + 1
                var y = 0
                
                while x < r - 1 {
                    board[x][y] = board[x + 1][y]
                    x += 1
                }
                
                while y < c - 1 {
                    board[x][y] = board[x][y + 1]
                    y += 1
                }
                
                while x > bottom {
                    board[x][y] = board[x - 1][y]
                    x -= 1
                }
                
                while y > 1 {
                    board[x][y] = board[x][y - 1]
                    board[x][y - 1] = 0
                    y -= 1
                }
            }
            
            
        }
    }
}
