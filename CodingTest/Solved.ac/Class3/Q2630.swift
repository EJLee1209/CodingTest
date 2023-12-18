//
//  Q2630.swift
//  CodingTest
//
//  Created by 이은재 on 12/18/23.
//

import Foundation

struct Q2630: Template {
    static func solution() {
        let n = Int(readLine()!)!
        var board: [[Int]] = []
        for _ in 0..<n {
            board.append(readLine()!.split(separator: " ").map { Int(String($0))! })
        }
        
        var whiteCnt = 0
        var blueCnt = 0
        func splitPaper(y: Int, x: Int, n: Int) {
            var white = 0
            var blue = 0
            for i in y..<y+n {
                for j in x..<x+n {
                    if board[i][j] == 1 { blue += 1 }
                    else { white += 1 }
                }
            }
            let size = n * n
            if size == blue { blueCnt += 1 }
            else if size == white { whiteCnt += 1 }
            else {
                // 4개의 정사각형으로 나눔
                splitPaper(y: y, x: x, n: n / 2)
                splitPaper(y: y, x: x + n / 2, n: n / 2)
                splitPaper(y: y + n / 2, x: x, n: n / 2)
                splitPaper(y: y + n / 2, x: x + n / 2, n: n / 2)
            }
        }
        splitPaper(y: 0, x: 0, n: n)
        print(whiteCnt)
        print(blueCnt)
    }
}
