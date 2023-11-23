//
//  2475.swift
//  CodingTest
//
//  Created by 이은재 on 11/23/23.
//https://www.acmicpc.net/problem/2475

import Foundation

struct Q2475: Template {
    static func solution() {
        let numbers = readLine()!.split(separator: " ").map { Int($0)! }
        print(numbers.reduce(0) { $0 + ($1 * $1) } % 10)
    }
}
