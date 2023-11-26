//
//  Q1920.swift
//  CodingTest
//
//  Created by 이은재 on 11/25/23.
//

import Foundation

struct Q1920: Template {
    static func solution() {
        let n = Int(readLine()!)!
        let a = readLine()!.split(separator: " ").map { Int($0)! }
        let m = Int(readLine()!)!
        let b = readLine()!.split(separator: " ").map { Int($0)! }
        
        var aSet = Set<Int>()
        a.forEach { v in
            aSet.insert(v)
        }
        
        b.forEach { v in
            if aSet.contains(v) {
                print(1)
            } else {
                print(0)
            }
        }
    }
}
