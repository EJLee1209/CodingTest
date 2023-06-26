//
//  2562.swift
//  CodingTest
//
//  Created by 이은재 on 2023/06/26.
//

import Foundation

class Q2562{
    static func solution() {
        var maxValue = -1
        var idx = 0
        for i in 1...9 {
            if let input = Int(readLine()!), input > maxValue {
                maxValue = input
                idx = i
            }
        }
        print(maxValue)
        print(idx)
    }
}
