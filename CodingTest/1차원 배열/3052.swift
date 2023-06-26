//
//  3052.swift
//  CodingTest
//
//  Created by 이은재 on 2023/06/26.
//

import Foundation
class Q3052{
    static func solution() {
        var arr : [Int] = []
        for _ in 0..<10 {
            arr.append(Int(readLine()!)! % 42)
        }
        print(Set(arr).count)
    }
}
