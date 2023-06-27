//
//  2738.swift
//  CodingTest
//
//  Created by 이은재 on 2023/06/27.
//

import Foundation
class Q2738{
    static func solution() {
        let nm = readLine()!.split(separator: " ").map{ Int(String($0))! }
        let n = nm[0], m = nm[1]
        var a = [[Int]](), b = [[Int]]()
        for _ in 1...n {
            a.append(readLine()!.split(separator: " ").map{ Int(String($0))! })
        }
        for _ in 1...n {
            b.append(readLine()!.split(separator: " ").map{ Int(String($0))! })
        }
        
        for i in 0..<n {
            for j in 0..<m {
                print(a[i][j] + b[i][j], terminator: " ")
            }
            print()
        }
        
    }
}
