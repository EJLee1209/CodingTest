//
//  1157.swift
//  CodingTest
//
//  Created by 이은재 on 2023/06/27.
//

import Foundation
class Q1157{
    static func solution() {
        // 방법 1.아스키 코드 활용
//        var dictionary = Array(repeating:0,count:26) // A~Z
//        let s = readLine()!.map { Character($0.uppercased()) }.map { Int($0.asciiValue!) - 65 }
//        s.forEach { idx in
//            dictionary[idx] += 1
//        }
//        let big = dictionary.max()!
//        let bigIndexFront = dictionary.firstIndex(of: big)!
//        let bigIndexBack = dictionary.lastIndex(of: big)!
//        if bigIndexBack == bigIndexFront {
//            let scalar = String(UnicodeScalar(bigIndexFront+65)!)
//            print(scalar)
//        } else {
//            print("?")
//        }
        // 방법 2.딕셔너리 활용
        var dict: [String:Int] = [:]
        let _ = readLine()!.map{ String($0.uppercased()) }.map {
            if dict[$0] == nil {
                dict[$0] = 1
            } else {
                dict[$0]! += 1
            }
        }
        var result = ""
        let maxValue = dict.values.max()
        for key in dict.keys {
            if dict[key] == maxValue {
                result+=key
            }
        }
        print(result.count>1 ? "?" : result)
        
    }
}
