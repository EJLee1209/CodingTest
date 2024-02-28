//
//  Q1475.swift
//  CodingTest
//
//  Created by 이은재 on 2/28/24.
//https://www.acmicpc.net/problem/1475

import Foundation
struct Q1475: Template {
    static func solution() {
        let n = readLine()!.map { Int(String($0))! }
        var arr = Array(repeating: 0, count: 10)
        
        for v in n {
            arr[v] += 1
        }
        
        var answer = 1
        for i in 0..<10 where i != 6 && i != 9 {
            answer = max(answer, arr[i])
        }
        print(max(answer, (arr[6] + arr[9] + 1) / 2))
    }
}
