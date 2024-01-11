//
//  Q1149.swift
//  CodingTest
//
//  Created by 이은재 on 1/9/24.
//https://www.acmicpc.net/problem/1149

import Foundation

struct Q1149: Template {
    static func solution() {
        let N = Int(readLine()!)!
        var rgbCost: [[Int]] = [[0,0,0]]
        for _ in 0..<N {
            rgbCost.append(readLine()!.split(separator: " ").map { Int(String($0))! })
        }

        for i in 1...N {
            rgbCost[i][0] += min(rgbCost[i - 1][1], rgbCost[i - 1][2])
            rgbCost[i][1] += min(rgbCost[i - 1][0], rgbCost[i - 1][2])
            rgbCost[i][2] += min(rgbCost[i - 1][0], rgbCost[i - 1][1])
        }

        print(rgbCost.last!.min()!)
    }
}
