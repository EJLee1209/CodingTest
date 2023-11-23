//
//  Q2839.swift
//  CodingTest
//
//  Created by 이은재 on 11/22/23.
//

import Foundation

struct Q2839: Template {
    static func solution() {
        let n = Int(readLine()!)!
        var result = -1
        
        for i in 0...(n/5) {
            let tmp = n - (i * 5)
            if tmp % 3 == 0 {
                result = (tmp / 3) + i
            }
        }
        print(result)
    }
}
