//
//  2563.swift
//  CodingTest
//
//  Created by 이은재 on 2023/06/27.
//

import Foundation
class Q2563{
    static func solution() {
        var paper = Array(repeating: [Int](repeating: 0, count: 100), count: 100)
        let n = Int(readLine()!)!
        for _ in 1...n {
            let xy = readLine()!.split(separator: " ").map{ Int(String($0))! }
            let x = xy[0], y = xy[1]
            for i in y..<y+10 {
                for j in x..<x+10 {
                    if paper[i][j] != 1 {
                        paper[i][j] = 1
                    }
                }
            }
        }
        var sum = 0
        for i in 0..<100 {
            for j in 0..<100 {
                sum += paper[i][j]
            }
        }
        print(sum)
    }
}
