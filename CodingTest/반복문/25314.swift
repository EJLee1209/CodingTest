//
//  25314.swift
//  CodingTest
//
//  Created by 이은재 on 2023/06/25.
//

import Foundation

class Q25314{
    static func solution() {
        let n = Int(readLine()!)! / 4
        var longStr = ""
        
        for _ in 0..<n {
            longStr += "long "
        }
        
        print("\(longStr)int")
    }
}
