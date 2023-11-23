//
//  2566.swift
//  CodingTest
//
//  Created by 이은재 on 2023/06/27.
//

import Foundation
class Q2566{
    static func solution() {
        var maxValue = -1
        var a = 0
        var b = 0
        for i in 0..<9 {
            let row = readLine()!.split(separator: " ").map { Int(String($0))! }
            
            for (j, value) in row.enumerated() {
                if value > maxValue {
                    maxValue = value
                    a = i + 1
                    b = j + 1
                }
            }
        }

        print(maxValue)
        print(a, b)
    }
}
