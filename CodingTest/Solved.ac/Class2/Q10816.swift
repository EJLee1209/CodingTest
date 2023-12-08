//
//  Q10816.swift
//  CodingTest
//
//  Created by 이은재 on 12/6/23.
//https://www.acmicpc.net/problem/10816

import Foundation

struct Q10816: Template {
    static func solution() {
        let n = Int(readLine()!)!
        let cards = readLine()!.split(separator: " ").map { Int($0)! }
        let m = Int(readLine()!)!
        let targets = readLine()!.split(separator: " ").map { Int($0)! }
        
        var cardDict: [Int: Int] = [:]
        
        cards.forEach { num in
            if let _ = cardDict[num] {
                cardDict[num]! += 1
            } else{
                cardDict[num] = 1
            }
        }
        targets.forEach { num in
            if let cnt = cardDict[num] {
                print(cnt, terminator: " ")
            } else {
                print(0, terminator: " ")
            }
        }
    }
}
