//
//  6064.swift
//  CodingTest
//
//  Created by 이은재 on 12/25/23.
//https://www.acmicpc.net/problem/6064

import SwiftUI

struct Q6064: Template {
    static func solution() {
        let t = Int(readLine()!)!
        for _ in 0..<t {
            let mnxy = readLine()!.split(separator: " ").map { Int($0)! }
            let (M, N, X, Y) = (mnxy[0], mnxy[1], mnxy[2], mnxy[3])
            let maxYear = lcm(M, N)
            
            var isValid = false
            for i in 0..<maxYear/M {
                let year = i * M + X
                let y = year % N == 0 ? N : year % N
                
                if y == Y {
                    print(year)
                    isValid = true
                    break
                }
            }
            if !isValid {
                print(-1)
            }
        }
        /// 최대 공약수(greatest common divisor)
        /// 유클리드 호제법
        /// 1. 큰 수를 작은 수로 나눈다
        /// 2. 나누는 수를 나머지로 계속 나눈다
        /// 3. 나머지가 0이면, 나누는 수가 최대 공약수이다.
        func gcd(_ a: Int, _ b: Int) -> Int {
            return b == 0 ? a : gcd(b, a % b)
        }
        /// 최소 공배수(least common multiple)
        func lcm(_ a: Int, _ b: Int) -> Int {
            return a * b / (a > b ? gcd(a, b) : gcd(b, a))
        }
    }
    
    
}
