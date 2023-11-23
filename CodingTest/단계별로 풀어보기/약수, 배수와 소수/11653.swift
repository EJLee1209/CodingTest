//
//  11653.swift
//  CodingTest
//
//  Created by 이은재 on 2023/06/30.
//

import Foundation
class Q11653{
    static func solution() {
        var num = Int(readLine()!)!
        if num != 1 {
            for i in 2..<num {
                while num % i == 0 {
                    num /= i
                    print(i)
                }
            }
            
            if num != 1 {
                print(num)
            }
        }
    }
}
