//
//  2444.swift
//  CodingTest
//
//  Created by 이은재 on 2023/06/27.
//

import Foundation
class Q2444{
    static func solution() {
        let n = Int(readLine()!)!
        // 내가 작성한 코드
//        for i in 0..<n {
//            for _ in 0..<n-i-1 {
//                print(" ",terminator: "")
//            }
//            for _ in 0..<2*i+1 {
//                print("*",terminator: "")
//            }
//            print()
//        }
//
//        for i in 1..<n {
//            for _ in 0..<i {
//                print(" ",terminator: "")
//            }
//            for _ in 0..<n*2-2*i-1 {
//                print("*",terminator: "")
//            }
//            print()
//        }
        // 구글링한 코드
        // String(repeating:count:) 메서드를 사용하면 더 간단하게 풀이 가능

        for i in 0..<n {
            print(String(repeating: " ", count: n-i-1) + String(repeating: "*", count: i*2+1))
        }

        for i in 0..<n-1 {
            print(String(repeating: " ", count: i+1) + String(repeating: "*", count: 2*(n-i)-3))
        }
    }
}
