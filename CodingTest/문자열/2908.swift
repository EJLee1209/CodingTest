//
//  2908.swift
//  CodingTest
//
//  Created by 이은재 on 2023/06/26.
//

import Foundation
class Q2908{
    static func solution() {
        let ab = readLine()!.split(separator: " ").map{ Int(String($0.reversed()))! }
        print(ab.max()!)
    }
}
