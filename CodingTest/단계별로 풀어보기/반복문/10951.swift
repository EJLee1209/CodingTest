//
//  10951.swift
//  CodingTest
//
//  Created by 이은재 on 2023/06/25.
//

import Foundation
class Q10951{
    static func solution() {
        while let input = readLine() {
            print(input.split(separator: " ").map{ Int(String($0))! }.reduce(0, +))
        }
    }
}
