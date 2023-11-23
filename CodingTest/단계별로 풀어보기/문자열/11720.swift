//
//  11720.swift
//  CodingTest
//
//  Created by 이은재 on 2023/06/26.
//

import Foundation
class Q11720{
    static func solution() {
        let _ = readLine()!
        print(readLine()!.map{ Int(String($0))! }.reduce(0, +))
    }
}
