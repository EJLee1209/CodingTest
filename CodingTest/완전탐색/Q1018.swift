//
//  Q1018.swift
//  CodingTest
//
//  Created by 이은재 on 11/22/23.
//https://www.acmicpc.net/problem/1018

import Foundation

struct Q1018: Template {
    static func solution() {
        let nm = readLine()!.split(separator: " ").map { Int($0)! }
        let (n,m) = (nm[0], nm[1])
        var board: [[String]] = []
        for _ in 0..<n {
            let row = readLine()!.map { String($0) }
            board.append(row)
        }
        
        var result = 65

        for i in 0...n-8 {
            for j in 0...m-8 {
                // board[i][j] 보드의 맨 왼쪽 위 칸
                var case1Cnt = 0
                var case2Cnt = 0
                var next = "W"
                for k in i..<i+8 {
                    for s in j..<j+8 {
                        if board[k][s] != next {
                            case1Cnt += 1
                        }
                        if board[k][s] == next {
                            case2Cnt += 1
                        }
                        
                        if s < j+7 {
                            if next == "W" { next = "B" }
                            else { next = "W" }
                        }
                    }
                }
                result = min(result, case1Cnt, case2Cnt)
            }
        }
        print(result)
    }
}
