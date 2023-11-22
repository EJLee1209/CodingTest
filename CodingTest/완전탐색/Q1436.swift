//
//  Q1436.swift
//  CodingTest
//
//  Created by 이은재 on 11/22/23.
//

import Foundation

struct Q1436: Template {
    static func solution() {
        let n = Int(readLine()!)!
        var cnt = 0
        var result = 666
        while true {
            if result.isDevilNumber() {
                cnt += 1
            }
            if cnt == n { break }
            result += 1
        }
        print(result)
    }
}

private extension Int {
    func isDevilNumber() -> Bool {
        var number = self
        while number >= 666 {
            if number % 1000 == 666 {
                return true
            }
            number /= 10
        }
        
        return false
    }
}
