//
//  Q1764.swift
//  CodingTest
//
//  Created by 이은재 on 12/16/23.
//

import Foundation

struct Q1764: Template {
    static func solution() {
        let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
        let (n,m) = (nm[0],nm[1])
        var notListen: Set<String> = []
        var notLook: Set<String> = []
        
        for _ in 0..<n {
            notListen.insert(readLine()!)
        }
        
        for _ in 0..<m {
            notLook.insert(readLine()!)
        }
        
        let notListenAndLook = notListen.intersection(notLook).sorted()
        print(notListenAndLook.count)
        print(notListenAndLook.joined(separator: "\n"))
    }
}
