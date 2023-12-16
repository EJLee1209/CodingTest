//
//  Q1931.swift
//  CodingTest
//
//  Created by 이은재 on 12/16/23.
//https://www.acmicpc.net/problem/1931

import Foundation

struct Q1931: Template {
    static func solution() {
        let n = Int(readLine()!)!
        var arr: [(s: Int, e: Int)] = []
        for _ in 0..<n {
            let se = readLine()!.split(separator: " ").map { Int(String($0))! }
            arr.append((se[0],se[1]))
        }
        
        arr.sort { $0.e == $1.e ? $0.s < $1.s : $0.e < $1.e }
        var count = 0
        var end = 0
        for (s, e) in arr {
            if s >= end {
                count += 1
                end = e
            }
        }
        print(count)
    }
}
