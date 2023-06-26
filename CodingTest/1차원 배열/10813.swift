//
//  10813.swift
//  CodingTest
//
//  Created by 이은재 on 2023/06/26.
//

import Foundation
class Q10813{
    static func solution() {
        let nm = readLine()!.split(separator: " ").map{ Int(String($0))! }
        var basket = Array(repeating: 0, count: nm[0])
        for i in 1...nm[0] {
            basket[i-1] = i
        }
        for _ in 0..<nm[1] {
            let ij = readLine()!.split(separator: " ").map{ Int(String($0))! }
            let tmp = basket[ij[0]-1]
            basket[ij[0]-1] = basket[ij[1]-1]
            basket[ij[1]-1] = tmp
        }
        print(basket.map{ "\($0)" }.joined(separator: " "))
    }
}
