//
//  Q17219.swift
//  CodingTest
//
//  Created by 이은재 on 1/4/24.
//https://www.acmicpc.net/problem/17219

import Foundation

struct Q17219: Template {
    static func solution() {
        let nm = readLine()!.split(separator: " ").map { Int($0)! }
        let (n, m) = (nm[0], nm[1])
        var passwordDict = [String: String]()
        
        for _ in 0..<n {
            let input = readLine()!.split(separator: " ").map { String($0) }
            passwordDict[input[0]] = input[1]
        }
        
        for _ in 0..<m {
            let address = readLine()!
            print(passwordDict[address]!)
        }
    }
}
