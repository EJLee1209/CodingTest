//
//  2720.swift
//  CodingTest
//
//  Created by 이은재 on 2023/06/28.
//

import Foundation
class Q2720{
    static func solution() {
        let t = Int(readLine()!)!
        for _ in 1...t {
            var result : [Int] = []
            var cent = Int(readLine()!)!
            result.append(cent/25)
            cent%=25
            result.append(cent/10)
            cent%=10
            result.append(cent/5)
            cent%=5
            result.append(cent/1)
            
            result.forEach {
                print($0, terminator: " ")
            }
            print()
        }
    }
}
