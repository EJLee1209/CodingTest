//
//  1330.swift
//  CodingTest
//
//  Created by 이은재 on 2023/06/24.
//

import Foundation
class Q1330{
    static func solution() {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        let a = input[0]
        let b = input[1]
        if a > b {
            print(">")
        } else if a == b {
            print("==")
        } else {
            print("<")
        }
    }
}
