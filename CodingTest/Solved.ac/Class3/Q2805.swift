//
//  Q2805.swift
//  CodingTest
//
//  Created by 이은재 on 12/19/23.
//https://www.acmicpc.net/problem/2805

import Foundation

struct Q2805: Template {
    static func solution() {
        let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
        let (n, m) = (nm[0], nm[1])
        let heights = readLine()!.split(separator: " ").map { Int(String($0))! }
        
        func treeHeights(_ cutHeight: Int) -> Int {
            var totalHeight = 0
            for h in heights {
                if h > cutHeight {
                    totalHeight += (h - cutHeight)
                }
            }
            return totalHeight
        }
        
        var lt = 1
        var rt = heights.max()!
        var result = 0
        while lt<=rt {
            let mid = (lt + rt) / 2
            if treeHeights(mid) >= m {
                result = mid
                lt = mid + 1
            } else {
                rt = mid - 1
            }
        }
        print(result)
    }
}
