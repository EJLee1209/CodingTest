//
//  10101.swift
//  CodingTest
//
//  Created by 이은재 on 2023/07/02.
//

import Foundation
class Q10101{
    static func solution() {
        let a = Int(readLine()!)!
        let b = Int(readLine()!)!
        let c = Int(readLine()!)!
        
        if a == 60 && b == 60 && c == 60 {
            print("Equilateral")
            
        } else if a + b + c == 180 {
            if a == b || a == c || b == c {
                print("Isosceles")
            } else {
                print("Scalene")
            }
        } else {
            print("Error")
        }
    }
}
