//
//  10818.swift
//  CodingTest
//
//  Created by 이은재 on 2023/06/25.
//

import Foundation
class Q10818{
    static func solution() {
        let _ = Int(readLine()!)!
        let array = readLine()!.split(separator: " ").map{ Int(String($0))! }
        print("\(array.min()!) \(array.max()!)")
    }
}
