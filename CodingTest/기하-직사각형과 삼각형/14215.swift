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
        let abc = readLine()!.split(separator: " ").map{ Int(String($0))! }.sorted { $0 < $1 }
        let a = abc[0], b = abc[1], c = abc[2]
        
        if c >= a + b {
            print((a+b)*2-1)
        } else {
            print(a+b+c)
        }
    }
}
