//
//  10430.swift
//  CodingTest
//
//  Created by 이은재 on 2023/06/24.
//

import Foundation

class Q10430{
    static func solution() {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        let (A, B, C) = (input[0], input[1], input[2])
        
        print((A+B)%C)
        print(((A%C) + (B%C))%C)
        print((A*B)%C)
        print(((A%C) * (B%C))%C)
    }
}
