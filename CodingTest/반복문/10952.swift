//
//  10952.swift
//  CodingTest
//
//  Created by 이은재 on 2023/06/25.
//

import Foundation
class Q10952{
    static func solution() {
        while true {
            let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
            if input == [0,0] {
                break
            }
            print(input[0]+input[1])
        }
    }
}
