//
//  Q2920.swift
//  CodingTest
//
//  Created by 이은재 on 11/23/23.
//

import Foundation

struct Q2920: Template {
    static func solution() {
        let numbers = readLine()!.split(separator: " ").map { Int($0)! }
        if numbers == (1...8).map { $0 } {
            print("ascending")
        } else if numbers == (1...8).map { $0 }.reversed() {
            print("descending")
        } else {
            print("mixed")
        }
    }
}
