//
//  2566.swift
//  CodingTest
//
//  Created by 이은재 on 2023/06/27.
//

import Foundation
class Q2566{
    static func solution() {
        var matrix = [[Int]]()
        for _ in 1...9 {
            matrix.append(readLine()!.split(separator: " ").map{ Int(String($0))! })
        }
        var maxValue = -1
        var maxIdx = ""
        for i in 0..<9 {
            for j in 0..<9 {
                if matrix[i][j] > maxValue {
                    maxValue = matrix[i][j]
                    maxIdx = "\(i+1) \(j+1)"
                }
            }
        }
        print(maxValue)
        print(maxIdx)
    }
}
