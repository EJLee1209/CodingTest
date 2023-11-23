//
//  Q19532.swift
//  CodingTest
//
//  Created by 이은재 on 11/22/23.
//

import Foundation

struct Q19532: Template {
    static func solution() {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        let (a,b,c,d,e,f) = (input[0],input[1],input[2],input[3],input[4],input[5])
        
        var flag = false
        for x in -999...999 {
            for y in -999...999 {
                if a*x+b*y == c && d*x+e*y == f {
                    print(x, y)
                    flag.toggle()
                    break
                }
            }
            if flag { break }
        }
        
    }
}
