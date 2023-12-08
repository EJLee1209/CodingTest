//
//  Q15829.swift
//  CodingTest
//
//  Created by 이은재 on 12/7/23.
//https://www.acmicpc.net/problem/15829

import Foundation

struct Q15829: Template {
    static func solution() {
        let l = Int(readLine()!)!
        let s = readLine()!
        var hashValue = 0
        for (i, c) in s.unicodeScalars.enumerated() {
            hashValue += ((Int(c.value) - 96) * Int(pow(31.0, Float(i))))
        }
        print(hashValue)
    }
}
