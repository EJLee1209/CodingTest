//
//  2588.swift
//  CodingTest
//
//  Created by 이은재 on 2023/06/24.
//

import Foundation

class Q2588{
    static func solution() {
        let a = Int(readLine()!)!
        let b = Int(readLine()!)!
        let bArray = "\(b)".map { Int(String($0))! }
        print(a*bArray[2])
        print(a*bArray[1])
        print(a*bArray[0])
        print(a*b)
    }
}
