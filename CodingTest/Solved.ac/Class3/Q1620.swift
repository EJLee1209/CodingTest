//
//  Q1620.swift
//  CodingTest
//
//  Created by 이은재 on 12/15/23.
//https://www.acmicpc.net/problem/1620

import Foundation

struct Q1620: Template {
    static func solution() {
        let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
        let (n,m) = (nm[0],nm[1])
        var numberToName: [Int: String] = [:]
        var nameToNumber: [String: Int] = [:]
        
        
        for num in 1...n {
            let name = readLine()!
            numberToName[num] = name
            nameToNumber[name] = num
        }
        
        for _ in 0..<m {
            let input = readLine()!
            if let number = Int(input) {
                print(numberToName[number]!)
            } else {
                print(nameToNumber[input]!)
            }
        }
    }
}
