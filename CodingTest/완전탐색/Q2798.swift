//
//  Q2798.swift
//  CodingTest
//
//  Created by 이은재 on 11/22/23.
//https://www.acmicpc.net/problem/2798

import Foundation

struct Q2798: Template {
    static func solution() {
        let nm = readLine()!.split(separator: " ").map { Int($0)! }
        let cards = readLine()!.split(separator: " ").map { Int($0)! }

        let (n,m) = (nm[0],nm[1])
        var result = -1
        for i in 0..<n-2 {
            for j in i+1..<n-1 {
                for k in j+1..<n {
                    let s = cards[i]+cards[j]+cards[k]
                    if m >= s {
                        result = max(result, s)
                    }
                }
            }
        }

        print(result)

    }
}
