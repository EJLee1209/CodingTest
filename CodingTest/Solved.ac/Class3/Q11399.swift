//
//  Q11399.swift
//  CodingTest
//
//  Created by 이은재 on 12/21/23.
//https://www.acmicpc.net/problem/11399

import Foundation

struct Q11399: Template {
    static func solution() {
        let n = Int(readLine()!)!
        let arr = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()
        
        var result = 0
        for i in 0..<n {
            result += arr[0...i].reduce(0, +)
        }
        print(result)
    }
}
