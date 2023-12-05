//
//  Q4153.swift
//  CodingTest
//
//  Created by 이은재 on 12/5/23.
//

import Foundation

struct Q4153: Template {
    static func solution() {
        while true {
            var input = readLine()!.split(separator: " ").map { Int($0)! }
            if input == [0,0,0] { break }
            
            input.sort()
            let (a,b,c) = (input[0],input[1],input[2])
            if a * a + b * b == c * c {
                print("right")
            } else {
                print("wrong")
            }
        }
    }
}
