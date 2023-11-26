//
//  Q1929.swift
//  CodingTest
//
//  Created by 이은재 on 11/25/23.
//https://www.acmicpc.net/problem/1929

import Foundation

struct Q1929: Template {
    static func solution() {
        let mn = readLine()!.split(separator: " ").map { Int($0)! }
        let (m,n) = (mn[0], mn[1])
        var checker: [Bool] = Array(repeating: false, count: n+1)
        var primeNumbers: [Int] = []
        
        for i in 2...n {
            if checker[i] { continue }
            
            primeNumbers.append(i)
            for j in stride(from: i, to: n+1, by: i) {
                checker[j] = true
            }
        }
        
        primeNumbers.filter { $0 >= m }.forEach { v in
            print(v)
        }
    }
}
