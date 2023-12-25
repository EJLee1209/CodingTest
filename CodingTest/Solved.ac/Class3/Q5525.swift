//
//  Q5525.swift
//  CodingTest
//
//  Created by 이은재 on 12/24/23.
//https://www.acmicpc.net/problem/5525

import Foundation

struct Q5525: Template {
    
    static func solution() {
        let n = Int(readLine()!)!
        let m = Int(readLine()!)!
        let s = readLine()!.map { $0 }
        
        var i = 0
        var result = 0
        var count = 0
        
        while i < m - 2 {
            if s[i...i+2] == ["I", "O", "I"] {
                i += 2
                count += 1 // IOI가 나온 횟수를 카운팅
                if count == n { // IOI가 n번 나왔는가?
                    count -= 1 // 다음 IOI를 세기 위해서
                    result += 1
                }
            } else {
                i += 1
                count = 0
            }
        }
        print(result)
        
        /// 접근 방법1 : 투 포인터 사용 (부분점수 50점)
        
        //        let size = 2 * n + 1
        //        var p = ""
        //        for i in 0..<size {
        //            if i % 2 == 0 {
        //                p += "I"
        //            } else {
        //                p += "O"
        //            }
        //        }
        //        var start = 0, end = 0
        //        var cnt = 0
        //        while true {
        //            end += 1
        //            if end >= m {
        //                break
        //            }
        //            if end - start == size {
        //                start += 1
        //            }
        //
        //            if String(s[start...end]) == p {
        //                cnt += 1
        //            }
        //        }
        //        print(cnt)
    }
}
