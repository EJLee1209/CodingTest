//
//  10869.swift
//  CodingTest
//
//  Created by 이은재 on 2023/06/24.
//

import Foundation

class Q10869 {
    static func solution(){
        let input = readLine()!.split(separator: " ").map{ Int($0)! }
        let a = input[0]
        let b = input[1]
        print(a+b)
        print(a-b)
        print(a*b)
        print(a/b)
        print(a%b)
    }
}
