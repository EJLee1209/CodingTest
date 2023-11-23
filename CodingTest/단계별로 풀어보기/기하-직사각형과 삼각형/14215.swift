//
//  14215.swift
//  CodingTest
//
//  Created by 이은재 on 2023/07/02.
//

import Foundation
class Q14215{
    static func solution() {
        /*
                삼각형을 만족하는 세 변 길이의 조건을 알고 있으면 쉬운 문제
                삼각형의 변의 길이가 오름차순으로 a,b,c 로 주어졌을 때,
                a+b > c 를 만족하면 삼각형임
            */
        let input = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
        let (a,b,c) = (input[0],input[1],input[2])

        if (c >= a + b) {
            print(2 * (a + b) - 1)
        } else {
            print(a + b + c)
        }
    }
}
