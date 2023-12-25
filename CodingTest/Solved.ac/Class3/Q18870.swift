//
//  Q18870.swift
//  CodingTest
//
//  Created by 이은재 on 12/23/23.
//https://www.acmicpc.net/problem/18870

import Foundation

struct Q18870: Template {
    static func solution() {
        let n = Int(readLine()!)!
        let X = readLine()!.split(separator: " ").map { Int(String($0))! }
        var cntDict: [Int: Int] = [:]
        
        for (idx, x) in Set(X).sorted().enumerated() {
            cntDict[x] = idx
        }
        
        for x in X {
            print(cntDict[x]!, terminator: " ")
        }
        print()
    }
}
