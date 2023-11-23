//
//  1193.swift
//  CodingTest
//
//  Created by 이은재 on 2023/06/29.
//

import Foundation
class Q1193{
    static func solution() {
        let X = Int(readLine()!)!
        var sum = 0 // 누적된 분수의 수
        var count = 1 // 한 대각선의 분모와 분자의 합
        
        var i = 1
        while X > sum {
            sum+=i
            i+=1
            count+=1
        }
        
        var isOdd : Bool {
            count % 2 == 0 ? true : false
        }
        
        var diag: [String] = []
        if isOdd {
            for i in 1..<count {
                diag.append("\(count-i)/\(i)")
            }
        } else {
            for i in 1..<count {
                diag.append("\(i)/\(count-i)")
            }
        }
        print(diag[diag.count - (sum-X) - 1])
    }
}
