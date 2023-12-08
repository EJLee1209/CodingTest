//
//  Q11650.swift
//  CodingTest
//
//  Created by 이은재 on 12/6/23.
//

import Foundation

struct Q11650: Template {
    static func solution() {
        let n = Int(readLine()!)!
        var xyArr: [(x: Int, y: Int)] = []
        
        for _ in 0..<n {
            let xy = readLine()!.split(separator: " ").map{ Int($0)! }
            xyArr.append((xy[0], xy[1]))
        }
        
        xyArr.sort { first, second in
            if first.x == second.x {
                return first.y < second.y
            } else {
                return first.x < second.x
            }
        }
        xyArr.forEach { x, y in
            print(x, y)
        }
    }
}
