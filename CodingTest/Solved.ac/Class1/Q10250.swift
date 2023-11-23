//
//  Q10250.swift
//  CodingTest
//
//  Created by 이은재 on 11/23/23.
//https://www.acmicpc.net/problem/10250

import Foundation

struct Q10250: Template {
    static func solution() {
        let t = Int(readLine()!)!
        for _ in 0..<t {
            let input = readLine()!.split(separator: " ").map { Int($0)! }
            let (h,w,n) = (input[0], input[1], input[2])
            
            var cnt = 0
            for i in 0..<w {
                for j in 0..<h {
                    cnt += 1
                    if cnt == n {
                        print("\(j+1)" + String(format: "%02d", i+1))
                    }
                }
            }
        }
    }
}
