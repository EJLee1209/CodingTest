//
//  10959.swift
//  CodingTest
//
//  Created by 이은재 on 2023/06/25.
//

import Foundation
class Q10950{
    static func solution() {
        let t = Int(readLine()!)!
        for _ in 0..<t {
            let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
            let a = input[0]
            let b = input[1]
            print(a+b)
        }
    }
}
