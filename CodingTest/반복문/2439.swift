//
//  2439.swift
//  CodingTest
//
//  Created by 이은재 on 2023/06/25.
//

import Foundation
class Q2439{
    static func solution() {
        let n = Int(readLine()!)!
        for i in 0..<n {
            for _ in 0..<n-i-1 {
                print(" ", terminator: "")
            }
            for _ in 0...i {
                print("*", terminator: "")
            }
            print()
        }
    }
}
