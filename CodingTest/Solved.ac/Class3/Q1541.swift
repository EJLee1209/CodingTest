//
//  Q1541.swift
//  CodingTest
//
//  Created by 이은재 on 12/15/23.
//https://www.acmicpc.net/problem/1541

import Foundation

struct Q1541: Template {
    static func solution() {
        let input = readLine()!.split(separator: "-")
        var result = 0
        for (idx, s) in input.enumerated() {
            let sum = s.split(separator: "+").map { Int(String($0))! }.reduce(0, +)
            if idx == 0 { result += sum }
            else { result -= sum }
            
        }
        print(result)
    }
}
