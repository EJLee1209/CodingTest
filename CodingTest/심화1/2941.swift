//
//  2941.swift
//  CodingTest
//
//  Created by 이은재 on 2023/06/27.
//

import Foundation
class Q2941{
    static func solution() {
        let croatia = ["c=", "c-", "dz=", "d-", "lj", "nj", "s=", "z="]
        var s = readLine()!
        for ch in croatia {
            s = s.replacingOccurrences(of: ch, with: " ")
            
        }
        print(s.count)
    }
}
