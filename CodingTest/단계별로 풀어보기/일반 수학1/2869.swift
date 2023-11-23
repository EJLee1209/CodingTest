//
//  2869.swift
//  CodingTest
//
//  Created by 이은재 on 2023/06/29.
//

import Foundation
class Q2869{
    static func solution() {
        let abv = readLine()!.split(separator: " ").map{ Double(String($0))! }
        let a = abv[0], b = abv[1], v = abv[2]
        // 시간 초과 코드
        // 하루에 낮에는 a 올라가고, 밤에 b 떨어져, v까지 올라가려면 몇 일 걸려?
//        var pos = 0
//        var count = 0
//        while true {
//            pos += a
//            count+=1
//            if pos >= v {
//                break
//            } else {
//                pos -= b
//            }
//        }
//        print(count)
        
        // 시간 초과나지 않는 코드
        // 수학적인 공식을 얻어내는 것이 중요했던 문제
        // 몇 일 걸리는지를 미지수 x로 두고 x를 구하는 식을 구해보면 다음과 같다.
        // x = (v-b)/(a-b)
        print(Int(ceil((v-b)/(a-b))))
    }
}
