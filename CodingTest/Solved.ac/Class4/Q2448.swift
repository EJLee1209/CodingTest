//
//  Q2448.swift
//  CodingTest
//
//  Created by 이은재 on 2/8/24.
//https://www.acmicpc.net/problem/2448

struct Q2448: Template {
    static func solution() {
        let n = Int(readLine()!)!
        var star = [
            "  *   ",
            " * *  ",
            "***** "
        ]
        
        var num = 3
        while num < n {
            let count = star.count
            
            var temp = [String]()
            
            for s in star {
                temp.append(s + s)
            }
            
            for i in 0..<count {
                var str = star[i]
                str = String(repeating: " ", count: count) + str + String(repeating: " ", count: count)
                star[i] = str
            }
            
            star.append(contentsOf: temp)
            
            num *= 2
        }
        
        for row in star {
            print(row)
        }
        
    }
}
