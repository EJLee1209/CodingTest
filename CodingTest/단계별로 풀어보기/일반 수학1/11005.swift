//
//  110005.swift
//  CodingTest
//
//  Created by 이은재 on 2023/06/28.
//

import Foundation
class Q11005{
    static func solution() {
        let nb = readLine()!.split(separator: " ").map{ Int(String($0))! }
        let n = nb[0], b = nb[1]
        print(String(n, radix: b).uppercased())
    }
}
