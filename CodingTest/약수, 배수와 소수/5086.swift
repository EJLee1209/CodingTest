//
//  5086.swift
//  CodingTest
//
//  Created by 이은재 on 2023/06/30.
//

import Foundation
class Q5086{
    static func solution() {
        while true {
            let ab = readLine()!.split(separator: " ").map{ Int(String($0))! }
            if ab == [0, 0] {
                break
            }
            let a = ab[0], b = ab[1]
            if b % a == 0 {
                print("factor")
                continue
            }
            if a % b == 0 {
                print("multiple")
                continue
            }
            print("neither")
        }
    }
}
