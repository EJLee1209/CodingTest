//
//  Q3085.swift
//  CodingTest
//
//  Created by 이은재 on 3/22/24.
//https://www.acmicpc.net/problem/3085

import Foundation

struct Q3085: Template {
    static func solution() {
        let n = Int(readLine()!)!
        var board = [[String]]()
        let dx = [-1, 1, 0, 0]
        let dy = [0, 0, -1, 1]
        var answer = 0
        
        for _ in 0..<n {
            let row = Array(readLine()!).map { String($0) }
            board.append(row)
        }

        for x in 0..<n {
            for y in 0..<n {
                for i in 0..<4 {
                    let nx = x + dx[i]
                    let ny = y + dy[i]
                    
                    if (0..<n).contains(nx) && (0..<n).contains(ny) && board[x][y] != board[nx][ny] {
                        let cache = board
                        let tmp = board[x][y]
                        board[x][y] = board[nx][ny]
                        board[nx][ny] = tmp
                        
                        var columnY = [String]()
                        var columnNy = [String]()
                        
                        for i in 0..<n {
                            columnY.append(board[i][y])
                            columnNy.append(board[i][ny])
                        }
                                                
                        if x == nx { // 같은 행
                            answer = max(
                                // 행 확인
                                longestLengthCount(array: board[x]),
                                // 열 확인
                                longestLengthCount(array: columnY),
                                longestLengthCount(array: columnNy),
                                answer
                            )
                            

                        } else if y == ny { // 같은 열
                            answer = max(
                                // 행 확인
                                longestLengthCount(array: board[x]),
                                longestLengthCount(array: board[y]),
                                // 열 확인
                                longestLengthCount(array: columnY),
                                answer
                            )
                        }
                        
                        board = cache
                    }
                }
            }
        }
        print(answer)
        
        func longestLengthCount<T: Comparable>(array: [T]) -> Int {
            let n = array.count
            guard n > 1 else { return n }
            var dp = Array(repeating: 1, count: n)
            
            for i in 1..<n {
                if array[i] == array[i - 1] {
                    dp[i] = dp[i - 1] + 1
                }
            }
            
            return dp.max()!
        }
    }
}
