//
//  Q18111.swift
//  CodingTest
//
//  Created by 이은재 on 12/7/23.
//https://www.acmicpc.net/problem/18111

import Foundation

struct Q18111: Template {
    static func solution() {
        let nmb = readLine()!.split(separator: " ").map { Int($0)! }
        let (n, m, b) = (nmb[0], nmb[1], nmb[2])
        var ground: [[Int]] = []
        
        for _ in 0..<n {
            let row = readLine()!.split(separator: " ").map { Int($0)! }
            ground.append(row)
        }
        
        var minTime = 2147000000
        var height = 257
        for h in 0...256 {
            var useCount = 0
            var takeCount = 0
            
            for i in 0..<n {
                for j in 0..<m {
                    if ground[i][j] > h {
                        takeCount += (ground[i][j] - h)
                    } else {
                        useCount += (h - ground[i][j])
                    }
                }
            }
            if useCount > takeCount + b { continue }
            
            let time = takeCount * 2 + useCount
            
            if minTime >= time {
                minTime = time
                height = h
            }
        }
        
        print(minTime, height)
    }
}
