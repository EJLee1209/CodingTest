//
//  10813.swift
//  CodingTest
//
//  Created by 이은재 on 2023/06/26.
//

import Foundation
class Q10813{
    static func solution() {
        let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
        let (n, m) = (nm[0], nm[1])
        var basket = (1...n).map { $0 }

        (0..<m).map { _ in
            let ij = readLine()!.split(separator: " ").map { Int(String($0))! }
            let (i,j) = (ij[0], ij[1])
            basket.swapAt(i-1, j-1)
        }
        print(basket.map { String($0) }.joined(separator: " "))
    }
}
