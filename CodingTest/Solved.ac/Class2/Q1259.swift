//
//  Q1259.swift
//  CodingTest
//
//  Created by 이은재 on 11/23/23.
//

import Foundation

struct Q1259: Template {
    static func solution() {
        while true {
            let word = readLine()!.map { String($0) }
            if word == ["0"] { break }
            
            var result = "yes"
            for i in 0..<word.count/2 {
                if word[i] != word[word.count-i-1] {
                    result = "no"
                    break
                }
            }
            print(result)
        }
    }
}
