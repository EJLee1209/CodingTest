//
//  Q14502.swift
//  CodingTest
//
//  Created by 이은재 on 2/3/24.
//

struct Q14502: Template {
    static func solution() {
        let dx = [-1, 1, 0, 0]
        let dy = [0, 0, -1, 1]
        let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
        let (n, m) = (nm[0], nm[1])
        var area: [[Int]] = []
        var answer = 0
        
        for _ in 0..<n {
            let input = readLine()!.split(separator: " ").map { Int(String($0))! }
            area.append(input)
        }
        
        for i in 0..<n * m {
            for j in i + 1..<n * m {
                for k in j + 1..<n * m {
                    var board = area
                    let wallPos = [(i/m, i%m), (j/m, j%m), (k/m, k%m)]
                    var wallCount = 0
                    for (x, y) in wallPos where board[x][y] == 0 {
                        wallCount += 1
                        board[x][y] = 1
                    }
                    
                    if wallCount < 3 {
                        continue
                    }
                    
                    for s in 0..<n {
                        for t in 0..<m where board[s][t] == 2 {
                            board = spreadVirus(x: s, y: t, arr: board)
                        }
                    }
                    
                    var cnt = 0
                    for row in board {
                        for value in row where value == 0 {
                            cnt += 1
                        }
                    }
                    answer = max(answer, cnt)
                }
            }
        }
        
        print(answer)
        
        func spreadVirus(x: Int, y: Int, arr: [[Int]]) -> [[Int]] {
            var arr = arr
            var queue = [(x, y)]
            var front = 0
            
            while front < queue.count {
                let curPos = queue[front]
                front += 1
                
                for i in 0..<4 {
                    let nx = curPos.0 + dx[i]
                    let ny = curPos.1 + dy[i]
                    
                    if (0..<n).contains(nx) && (0..<m).contains(ny) && arr[nx][ny] == 0 {
                        arr[nx][ny] = 3
                        queue.append((nx, ny))
                    }
                }
            }
            
            return arr
        }
        
    }
}
