//
//  2501.swift
//  CodingTest
//
//  Created by 이은재 on 2023/06/30.
//

import Foundation
class Q2501{
    static func solution() {
        let nk = readLine()!.split(separator: " ").map{ Int(String($0))! }
        let n = nk[0], k = nk[1]
        var count = 0, result = 0
        for i in 1...n {
            if n % i == 0{
                count += 1
                if count == k {
                    result = i
                    break
                }
            }
        }
        print(result)
    }
}
