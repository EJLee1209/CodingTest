//
//  Q11651.swift
//  CodingTest
//
//  Created by 이은재 on 12/7/23.
//

import Foundation

struct Q11651: Template {
    
    static func solution() {
        struct Coordinate {
            var x: Int
            var y: Int
        }
        let n = Int(readLine()!)!
        var coords: [Coordinate] = []
        for _ in 0..<n {
            let xy = readLine()!.split(separator: " ").map { Int($0)! }
            coords.append(Coordinate(x: xy[0], y: xy[1]))
        }
        coords.sort {
            if $0.y == $1.y {
                return $0.x < $1.x
            }
            return $0.y < $1.y
        }
        coords.forEach { print($0.x, $0.y) }
    }
}
