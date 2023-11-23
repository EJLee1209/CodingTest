//
//  Q24268.swift
//  CodingTest
//
//  Created by 이은재 on 11/21/23.
// https://www.acmicpc.net/problem/24268

import Foundation
struct Q24268: Template {
    static func solution() {
        let a = readLine()!.split(separator: " ").map { Int($0)! }
        let c = Int(readLine()!)!
        let n = Int(readLine()!)!

        if a[0] * n + a[1] <= c * n && a[0] <= c {
            print(1)
        } else {
            print(0)
        }
    }
}
