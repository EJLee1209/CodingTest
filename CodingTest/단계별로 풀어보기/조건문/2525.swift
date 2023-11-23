//
//  2525.swift
//  CodingTest
//
//  Created by 이은재 on 2023/06/24.
//

import Foundation
class Q2525{
    static func solution() {
        let input = readLine()!.split(separator:" ").map{ Int(String($0))! }
        let time = Int(readLine()!)!
        var h = input[0]
        var m = input[1] + time
        
        if m >= 60 {
            h += m/60
            m %= 60
            if h >= 24 {
                h = abs(24-h)
            }
        }
        
        print("\(h) \(m)")
    }
}
