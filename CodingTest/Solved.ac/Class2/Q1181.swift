//
//  Q1181.swift
//  CodingTest
//
//  Created by 이은재 on 11/23/23.
//

import Foundation

struct Q1181: Template {
    static func solution() {
        let n = Int(readLine()!)!
        var strSet = Set<String>()
        for _ in 0..<n {
            let s = readLine()!
            strSet.insert(s)
        }
        let strArr = strSet.map { $0 }.sorted {
            let curCnt = $0.count
            let nextCnt = $1.count
            if curCnt == nextCnt {
                return $0 < $1
            } else {
                return curCnt < nextCnt
            }
        }
        strArr.forEach { print($0) }
    }
}
