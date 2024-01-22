//
//  Q2573.swift
//  CodingTest
//
//  Created by 이은재 on 1/22/24.
//https://www.acmicpc.net/problem/2573

struct Q2573: Template {
    static func solution() {
        let dx = [-1, 1, 0, 0]
        let dy = [0, 0, -1, 1]
        let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
        let (N, M) = (NM[0], NM[1])
        var board = [[Int]]()
        var iceList = [(Int, Int)]()
        
        for i in 0..<N {
            let row = readLine()!.split(separator: " ").map { Int(String($0))! }
            for j in 0..<M where row[j] > 0 {
                iceList.append((i, j))
            }
            board.append(row)
        }
        
        var year = 0
        while !iceList.isEmpty && findGroundCount() < 2 {
            year += 1
            iceList = melting()
        }
        
        print(iceList.isEmpty ? 0 : year)
        
        func findSea() -> [[Bool]] {
            var isSea = Array(repeating: Array(repeating: false, count: M), count: N)
            for i in 0..<N {
                for j in 0..<M {
                    if board[i][j] == 0 {
                        isSea[i][j] = true
                    }
                }
            }
            
            return isSea
        }
        
        func melting() -> [(Int, Int)] {
            var tempList: [(Int, Int)] = []
            
            let isSea = findSea()
            for (x, y) in iceList {
                var numberOfSea = 0
                for i in 0..<4 {
                    let nx = x + dx[i]
                    let ny = y + dy[i]
                    
                    if isSea[nx][ny] {
                        numberOfSea += 1
                    }
                }
                
                let height = board[x][y] - numberOfSea
                board[x][y] = height < 0 ? 0 : height
                
                if height > 0 {
                    tempList.append((x, y))
                }
            }
            
            return tempList
        }
        
        func findGroundCount() -> Int {
            var count = 0
            var visited = Array(repeating: Array(repeating: false, count: M), count: N)
            
            for (x, y) in iceList {
                if !visited[x][y] {
                    count += 1
                    DFS(x: x, y: y)
                }
            }
            
            func DFS(x: Int, y: Int) {
                visited[x][y] = true
                
                for i in 0..<4 {
                    let nx = x + dx[i]
                    let ny = y + dy[i]
                    
                    if !visited[nx][ny] && board[nx][ny] > 0 {
                        DFS(x: nx, y: ny)
                    }
                }
                
            }
            
            return count
        }
    }
}
