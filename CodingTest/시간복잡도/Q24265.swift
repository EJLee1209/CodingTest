//
//  Q24265.swift
//  CodingTest
//
//  Created by 이은재 on 11/21/23.
//https://www.acmicpc.net/problem/24265

import Foundation
struct Q24265: Template {
    static func solution() {
        let n = Int(readLine()!)!
        if n > 1 {
            print((1...n-1).reduce(0, +))
        } else {
            print(0)
        }
        
        print(2)
    }
}
