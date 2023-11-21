//
//  2563.swift
//  CodingTest
//
//  Created by 이은재 on 2023/06/27.
//

import Foundation
class Q2563{
    static func solution() {
        let n = Int(readLine()!)!
        var paper = Array(repeating: Array(repeating: 0, count: 100), count: 100)
        var area = 0
        for _ in 0..<n {
            let xy = readLine()!.split(separator: " ").map { Int($0)! }
            let (x,y) = (xy[0], xy[1])
            
            for i in y..<y+10 {
                for j in x..<x+10 {
                    if paper[i][j] == 0 {
                        paper[i][j] = 1
                        area += 1
                    }
                }
            }
        }
        print(area)
    }
}
