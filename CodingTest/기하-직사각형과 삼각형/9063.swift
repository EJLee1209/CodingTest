//
//  9063.swift
//  CodingTest
//
//  Created by 이은재 on 2023/07/01.
//

import Foundation
class Q9063{
    static func solution() {
        let n = Int(readLine()!)!
        var maxX = -10001, minX = 10001, maxY = -10001, minY = 10001
        for _ in 1...n {
            let xy = readLine()!.split(separator: " ").map{ Int(String($0))! }
            let x = xy[0], y = xy[1]
            maxX = max(maxX, x)
            minX = min(minX, x)
            maxY = max(maxY, y)
            minY = min(minY, y)
        }
        print((maxX-minX) * (maxY-minY))
    }
}
