//
//  2581.swift
//  CodingTest
//
//  Created by 이은재 on 2023/06/30.
//

import Foundation
class Q2581{
    static func solution() {
        let m = Int(readLine()!)!
        let n = Int(readLine()!)!
        var primeNumbers: [Int] = []
        for num in m...n {
            var isPrime = true
            if num == 1 {
                continue
            }
            for i in 2..<num {
                if num % i == 0 {
                    isPrime.toggle()
                    break
                }
            }
            if isPrime { primeNumbers.append(num) }
        }
        if primeNumbers.isEmpty {
            print(-1)
        } else {
            print(primeNumbers.reduce(0,+))
            print(primeNumbers[0])
        }
    }
}
