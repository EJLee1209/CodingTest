//
//  Q10989.swift
//  CodingTest
//
//  Created by 이은재 on 12/7/23.
//https://www.acmicpc.net/problem/10989

import Foundation

struct Q10989: Template {
    static func solution() {
        let n = Int(readLine()!)!
        var numbers: [Int] = []
        for _ in 0..<n {
            numbers.append(Int(readLine()!)!)
        }
        numbers.sorted().forEach { print($0) }
    }
}
