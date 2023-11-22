//
//  Q2231.swift
//  CodingTest
//
//  Created by 이은재 on 11/22/23.
// https://www.acmicpc.net/problem/2231

import Foundation

struct Q2231: Template {
    static func solution() {
        let n = Int(readLine()!)!
        var result = 0
        
        for i in stride(from: n, to: 0, by: -1) {
            var tmp = i
            var s = 0
            while tmp > 0 {
                s += (tmp % 10)
                tmp /= 10
            }
            s += i
            if s == n {
                result = i
            }
        }
        print(result)
    }

}
