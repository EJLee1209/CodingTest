//
//  Q25305.swift
//  CodingTest
//
//  Created by 이은재 on 11/23/23.
//

import Foundation

struct Q25305: Template {
    static func solution() {
        let nk = readLine()!.split(separator: " ").map { Int($0)! }
        let scores = readLine()!.split(separator: " ").map { Int($0)! }.sorted { $0 > $1 }
        print(scores[nk[1]-1])
    }
}
