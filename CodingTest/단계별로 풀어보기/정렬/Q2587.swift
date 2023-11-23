//
//  Q2587.swift
//  CodingTest
//
//  Created by 이은재 on 11/23/23.
//https://www.acmicpc.net/problem/2587

import Foundation

struct Q2587: Template {
    static func solution() {
        var numbers: [Int] = []
        var s = 0
        for _ in 0..<5 {
            let num = Int(readLine()!)!
            numbers.append(num)
            s += num
        }
        numbers.sort()
        print(s / numbers.count)
        print(numbers[numbers.count / 2])
    }
}
