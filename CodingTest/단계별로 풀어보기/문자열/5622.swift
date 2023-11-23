//
//  5622.swift
//  CodingTest
//
//  Created by 이은재 on 2023/06/26.
//

import Foundation
class Q5622{
    static func solution() {
        let times = [3,3,3,4,4,4,5,5,5,6,6,6,7,7,7,8,8,8,8,9,9,9,10,10,10,10]
        print(readLine()!.map{ times[Int($0.asciiValue!)-65] }.reduce(0, +))
    }
}
