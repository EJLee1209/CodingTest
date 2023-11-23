//
//  10809.swift
//  CodingTest
//
//  Created by 이은재 on 2023/06/26.
//

import Foundation
class Q10809{
    static func solution() {
        let s = readLine()!.map{ String($0) }
        var arr = Array(repeating: -1,count:26)
        for (idx, ch) in s.enumerated() {
            let strIdx = Int(UnicodeScalar(ch)!.value) - 97
            if arr[strIdx] == -1 {
                arr[strIdx] = idx
            }
        }
        arr.forEach { print($0, terminator: " ") }
        
    }
}
