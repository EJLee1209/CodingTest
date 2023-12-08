//
//  Q18110.swift
//  CodingTest
//
//  Created by 이은재 on 12/7/23.
//

import Foundation

struct Q18110: Template {
    static func solution() {
        let n = Int(readLine()!)!
        if n > 0 {
            let k = Int(round(Double(n) * 0.15))
            var arr: [Int] = []
            for _ in 0..<n {
                arr.append(Int(readLine()!)!)
            }
            arr.sort()
            let arr2 = arr[k..<n-k]
            print(Int(round(Double(arr2.reduce(0, +)) / Double(arr2.count))))
        } else {
            print(0)
        }
    }
}
