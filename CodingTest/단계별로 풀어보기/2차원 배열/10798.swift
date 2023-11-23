//
//  10798.swift
//  CodingTest
//
//  Created by 이은재 on 2023/06/27.
//

import Foundation
class Q10798{
    static func solution() {
        var arr = [[String]]()
        for _ in 1...5 {
            arr.append(readLine()!.map{ String($0) })
        }
        for i in 0..<15 {
            for j in 0..<5 {
                if arr[j].count <= i {
                    continue
                }
                print(arr[j][i],terminator: "")
            }
        }
    }
}
