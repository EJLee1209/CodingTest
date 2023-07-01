//
//  1085.swift
//  CodingTest
//
//  Created by 이은재 on 2023/07/01.
//

import Foundation
class Q1085{
    static func solution() {
        let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
        let x = input[0], y = input[1], w = input[2], h = input[3]
        print(min(x, y, w-x, h-y))
    }
}
