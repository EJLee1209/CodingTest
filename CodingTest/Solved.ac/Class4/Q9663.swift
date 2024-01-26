//
//  Q9663.swift
//  CodingTest
//
//  Created by 이은재 on 1/26/24.
//https://www.acmicpc.net/problem/9663

struct Q9663: Template {
    static func solution() {
        let n = Int(readLine()!)!
        var board = Array(repeating: 0, count: n)
        var visited = Array(repeating: false, count: n)
        var answer = 0
        
        func check(x: Int) -> Bool {
            for i in 0..<x {
                if board[i] == board[x] {
                    // 같은 열
                    return false
                }
                if abs(board[i] - board[x]) == abs(i - x) {
                    // 같은 행
                    return false
                }
            }
            return true
        }
        
        func dfs(x: Int) {
            if x == n {
                answer += 1
                return
            }
            
            for i in 0..<n{
                if visited[i] { continue }
                
                board[x] = i
                if check(x: x) {
                    visited[i] = true
                    dfs(x: x + 1) // 다음 행으로 이동
                    visited[i] = false
                }
            }
        }
        
        dfs(x: 0)
        print(answer)
    }
}
