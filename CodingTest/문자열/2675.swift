//
//  2675.swift
//  CodingTest
//
//  Created by 이은재 on 2023/06/26.
//

import Foundation
class Q2675{
    static func solution() {
        let t = Int(readLine()!)!
        for _ in 0..<t {
            let rs = readLine()!.split(separator: " ").map{ String($0) }
            let r = Int(rs[0])!, s = rs[1]
            s.forEach { ch in
                for _ in 0..<r {
                    print(ch,terminator: "")
                }
            }
            print()
        }
    }
}
