//
//  2753.swift
//  CodingTest
//
//  Created by 이은재 on 2023/06/24.
//

import Foundation
class Q2753{
    static func solution() {
        let year = Int(readLine()!)!
        if year % 4 == 0, (year % 100 != 0 || year % 400 == 0) {
            print(1)
        } else {
            print(0)
        }
    }
}
