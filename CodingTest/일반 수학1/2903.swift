//
//  2903.swift
//  CodingTest
//
//  Created by 이은재 on 2023/06/28.
//

import Foundation
class Q2903{
    static func solution() {
        let n = Int(readLine()!)!
        var number = 2
        for _ in 1...n {
            number = number*2-1
        }
        print(number*number)
    }
}
