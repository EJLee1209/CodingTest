//
//  3003.swift
//  CodingTest
//
//  Created by 이은재 on 2023/06/27.
//

import Foundation
class Q3003{
    static func solution() {
        let chess = readLine()!.split(separator:" ").map{ Int(String($0))! }
        let total = [1,1,2,2,2,8]
        
        for i in 0..<chess.count {
            print(total[i] - chess[i], terminator: " ")
        }
    }
}
