//
//  Q9375.swift
//  CodingTest
//
//  Created by 이은재 on 12/28/23.
//

import Foundation

struct Q9375: Template {
    static func solution() {
        let T = Int(readLine()!)!
        
        for _ in 0..<T {
            let n = Int(readLine()!)!
            var clothDict: [String: Int] = [:]
            /// 옷의 종류마다 경우의 수를 counting해서 모두 곱해주고, 아무것도 입지 않은 경우 1가지를 빼준다.
            for _ in 0..<n {
                let input = readLine()!.split(separator: " ").map { String($0) }
                if let cnt = clothDict[input[1]] {
                    clothDict[input[1]] = cnt + 1
                } else {
                    clothDict[input[1]] = 2
                }
            }
            
            print(clothDict.values.reduce(1, *) - 1)
        }
    }
}
