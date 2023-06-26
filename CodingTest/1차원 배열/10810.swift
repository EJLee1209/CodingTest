//
//  10810.swift
//  CodingTest
//
//  Created by 이은재 on 2023/06/26.
//

import Foundation
class Q10810{
    static func solution() {
        let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
        let n = input[0]
        let m = input[1]
        var basket = Array(repeating: 0, count: n)
        for _ in 0..<m {
            let secondInput = readLine()!.split(separator: " ").map{ Int(String($0))! }
            for i in secondInput[0]-1..<secondInput[1] {
                basket[i] = secondInput[2]
            }
        }
        print(basket.map { "\($0)" }.joined(separator: " "))
    }
}
