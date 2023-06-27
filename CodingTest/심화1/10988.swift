//
//  10988.swift
//  CodingTest
//
//  Created by 이은재 on 2023/06/27.
//

import Foundation
class Q10988{
    static func solution() {
        // 내가 작성한 코드
//        let s = readLine()!
//        if s == String(s.reversed()) { print(1) }
//        else { print(0) }
        
        // 구글링한 코드
        // 내가 작성한 코드도 틀린건 아니지만, 문제 출제 의도와 다른 접근 방식인듯
        let s = readLine()!.map{ String($0) }
        var flag = true
        
        for i in 0..<s.count/2 { // 절반만 해도 됨
            if s[i] != s[s.count-i-1] { // 앞 뒤 비교
                flag.toggle()
                break
            }
        }
        if flag {
            print(1)
        } else {
            print(0)
        }
    }
}
