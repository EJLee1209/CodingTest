//
//  ㅃ9461.swift
//  CodingTest
//
//  Created by 이은재 on 12/28/23.
//

import Foundation

struct Q9461: Template {
    static func solution() {
        let T = Int(readLine()!)!
        for _ in 0..<T {
            let N = Int(readLine()!)!
            var P: [Int] = Array(repeating: 1, count: N + 1)
            if N >= 4 {
                for i in 4...N {
                    P[i] = P[i - 3] + P[i - 2]
                }
            }
            print(P[N])
        }
    }
}
