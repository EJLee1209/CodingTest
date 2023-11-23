//
//  25304.swift
//  CodingTest
//
//  Created by 이은재 on 2023/06/25.
//

import Foundation
class Q25304{
    static func solution() {
        let x = Int(readLine()!)!
        let n = Int(readLine()!)!
        var sum = 0
        for _ in 0..<n {
            let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
            let a = input[0]
            let b = input[1]
            sum += a*b
        }
        if sum == x {
            print("Yes")
        } else {
            print("No")
        }
    }
}
