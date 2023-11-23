//
//  1546.swift
//  CodingTest
//
//  Created by 이은재 on 2023/06/26.
//

import Foundation
class Q1546{
    static func solution() {
        let n = Double(readLine()!)!
        let scores = readLine()!.split(separator: " ").map{ Double(String($0))! }
        let big = scores.max()!
        var sum = 0.0
        scores.map{
            sum += $0 / big * 100
        }
        print(sum/n)
    }
}
