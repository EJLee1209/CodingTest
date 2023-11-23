//
//  14681.swift
//  CodingTest
//
//  Created by 이은재 on 2023/06/24.
//

import Foundation
class Q14681{
    static func solution() {
        let x = Int(readLine()!)!
        let y = Int(readLine()!)!
        if x > 0, y > 0 {
            print(1)
        } else if x > 0, y < 0 {
            print(4)
        } else if x < 0, y > 0 {
            print(2)
        } else {
            print(3)
        }
    }
}
