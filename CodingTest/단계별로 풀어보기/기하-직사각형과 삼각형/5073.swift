//
//  5073.swift
//  CodingTest
//
//  Created by 이은재 on 2023/07/02.
//

import Foundation
class Q5073{
    static func solution() {
        while true {
            let abc = readLine()!.split(separator: " ").map{ Int(String($0))! }.sorted { $0 < $1 }
            if abc == [0, 0, 0] { break }
            let a = abc[0], b = abc[1], c = abc[2]
            
            if c >= a + b {
                print("Invalid")
            } else {
                if a == b && a == c {
                    print("Equilateral")
                } else if a == b || a == c || b == c {
                    print("Isosceles")
                } else {
                    print("Scalene")
                }
            }
        }
    }
}
