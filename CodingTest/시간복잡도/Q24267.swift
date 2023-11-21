//
//  Q24267.swift
//  CodingTest
//
//  Created by 이은재 on 11/21/23.
//https://www.acmicpc.net/problem/24267

import Foundation
struct Q24267: Template {
    static func solution() {
        let n = Int(readLine()!)!
        print(n*(n-1)*(n-2)/6)
        print(3)
    }
}
