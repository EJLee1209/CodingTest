//
//  9498.swift
//  CodingTest
//
//  Created by 이은재 on 2023/06/24.
//

import Foundation
class Q9498{
    static func solution() {
        let score = Int(readLine()!)!
        switch score {
        case 90...100:
            print("A")
        case 80...89:
            print("B")
        case 70...79:
            print("C")
        case 60...69:
            print("D")
        default:
            print("F")
        }
    }
}
