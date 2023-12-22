//
//  Q11726.swift
//  CodingTest
//
//  Created by 이은재 on 12/22/23.
//https://www.acmicpc.net/problem/11726

import Foundation

struct Q11726: Template {
    static func solution() {
        let n = Int(readLine()!)!
        var arr: [Int] = Array(repeating: 0, count: n + 1)
        for i in 1...n {
            if i <= 2 {
                arr[i] = i
                continue
            }
            arr[i] = (arr[i-2] + arr[i-1]) % 10007
        }
        print(arr[n])
    }
}

