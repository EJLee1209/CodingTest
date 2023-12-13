//
//  Q1074.swift
//  CodingTest
//
//  Created by 이은재 on 12/12/23.
//https://www.acmicpc.net/problem/1074

import Foundation

struct Q1074: Template {
    
    static func solution() {
        let nrc = readLine()!.split(separator: " ").map { Int($0)! }
        let (n,r,c) = (nrc[0],nrc[1],nrc[2])
        let size = Int(pow(2.0, Double(n)))
        var answer = 0
        
        func find(_ minY: Int, _ minX: Int, _ maxY: Int, _ maxX: Int) {
            if r >= minY && r <= minY + (maxY - minY - 1) / 2 && c >= minX && c <= minX + (maxX - minX - 1) / 2 {
                // 1사분면
                if maxY - minY == 2 {
                    return
                }
                find(minY, minX, minY + (maxY - minY) / 2, minX + (maxX - minX) / 2)
            } else if r >= minY && r <= minY + (maxY - minY - 1) / 2 && c >= minX + (maxX - minX) / 2 && c <= maxX - 1 {
                // 2사분면
                if maxY - minY == 2 {
                    answer += 1
                    return
                }
                answer += (maxY - minY) * (maxY - minY) / 4
                find(minY, minX + (maxX - minX) / 2, minY + (maxY - minY) / 2, maxX)
            } else if r >= minY + (maxY - minY) / 2 && r <= maxY - 1 && c >= minX && c <= minX + (maxX - minX - 1) / 2 {
                // 3사분면
                if maxY - minY == 2 {
                    answer += 2
                    return
                }
                answer += (maxY - minY) * (maxY - minY) / 4 * 2
                find(minY + (maxY - minY) / 2, minX, maxY, minX + (maxX - minX) / 2)
            } else {
                // 4사분면
                if maxY - minY == 2 {
                    answer += 3
                    return
                }
                answer += (maxY - minY) * (maxY - minY) / 4 * 3
                find(minY + (maxY - minY) / 2, minX + (maxX - minX) / 2, maxY, maxX)
            }
        }
        
        find(0, 0, size, size)
        print(answer)
    }
}
