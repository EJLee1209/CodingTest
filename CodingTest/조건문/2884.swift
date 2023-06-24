//
//  2884.swift
//  CodingTest
//
//  Created by 이은재 on 2023/06/24.
//

import Foundation
class Q2884{
    static func solution() {
        let input = readLine()!.split(separator:" ").map{ Int(String($0))! }
        var h = input[0]
        var m = input[1] - 45
        if m < 0 {
            if h > 0 {
                h -= 1
            } else {
                h = 23
            }
            m += 60
        }
        
        print("\(h) \(m)")
    }
}
