//
//  11382.swift
//  CodingTest
//
//  Created by 이은재 on 2023/06/24.
//

import Foundation
class Q11382{
    static func solution() {
        var sum = 0
        let _ = readLine()!.split(separator: " ").map{ sum += Int(String($0))! }
        print(sum)
    }
}
