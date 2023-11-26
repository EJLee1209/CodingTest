//
//  Q1654.swift
//  CodingTest
//
//  Created by 이은재 on 11/23/23.
//https://www.acmicpc.net/problem/1654

import Foundation

struct Q1654: Template {
    static func solution() {
        let kn = readLine()!.split(separator: " ").map { Int($0)! }
        let (k, n) = (kn[0], kn[1])
        var arr: [Int] = []
        
        for _ in 0..<k {
            arr.append(Int(readLine()!)!)
        }
        
        var lt = 1
        var rt = arr.max()!
        var result = 0
        while lt <= rt {
            let mid = (lt+rt)/2
            
            var cnt = 0
            for length in arr {
                cnt += (length / mid)
            }
            
            if cnt < n {
                rt = mid - 1
            } else {
                lt = mid + 1
                result = mid
            }
        }
        print(result)
    }
}
