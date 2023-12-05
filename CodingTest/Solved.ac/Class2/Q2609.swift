//
//  Q2609.swift
//  CodingTest
//
//  Created by 이은재 on 12/5/23.
//

import Foundation

struct Q2609: Template {
    /// 최대 공약수
    /// 2개의 자연수 a,b (a > b)에 대해서 a를 b로 나눈 나머지가 r일 때, a와 b의 최대 공약수는 b와 r의 최대 공약수와 같다.
    /// 이 성질을 이용해서 위 과정을 계속 반복해 나머지가 0이 나올 때까지 나누면 그 수가 최대 공약수이다.
    static func gcd(_ a: Int, _ b: Int) -> Int {
        var a = a, b = b
        while b != 0 {
            let r = a % b
            a = b
            b = r
        }
        return a
    }
    
    /// 최소 공배수
    /// a와 b(a > b)의 최소 공배수는 a와 b의 곱을 a와 b의 최대공약수로 나눈 것과 같다
    static func lcm(_ a: Int, _ b: Int) -> Int {
        return (a * b) / gcd(a, b)
    }
    
    static func solution() {
        var input = readLine()!.split(separator: " ").map { Int($0)! }
        input.sort { $0 > $1 }
        
        print(gcd(input[0], input[1]))
        print(lcm(input[0], input[1]))
    }
}
