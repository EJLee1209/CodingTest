//
//  5597.swift
//  CodingTest
//
//  Created by 이은재 on 2023/06/26.
//

import Foundation
class Q5597{
    static func solution() {
        var book = Array(repeating: 0, count: 30)
        for _ in 0..<28 {
            let num = Int(readLine()!)!
            book[num-1] = 1
        }
        for (idx, value) in book.enumerated() {
            if value == 0 {
                print(idx + 1)
            }
        }
    }
}
