//
//  Q9655.swift
//  CodingTest
//
//  Created by 이은재 on 3/20/24.
////https://www.acmicpc.net/problem/9655

struct Q9655: Template {
    static func solution() {
        let n = Int(readLine()!)!
        print(n.isMultiple(of: 2) ? "CY" : "SK")
    }
}
