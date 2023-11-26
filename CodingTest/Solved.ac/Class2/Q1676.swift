//
//  Q1676.swift
//  CodingTest
//
//  Created by 이은재 on 11/23/23.
//https://www.acmicpc.net/problem/1676

import Foundation

struct Q1676: Template {
    static func solution() {
        let num = Int(readLine()!)!
        var count = 0
        
        count += (num / 5)
        count += (num / 25)
        count += (num / 125)
        
        print(count)
    }
}
