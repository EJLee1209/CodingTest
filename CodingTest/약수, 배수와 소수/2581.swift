//
//  2581.swift
//  CodingTest
//
//  Created by 이은재 on 2023/06/30.
//

import Foundation
class Q2581{
    static func solution() {
//        let m = Int(readLine()!)!
//        let n = Int(readLine()!)!
//        var primeNumbers: [Int] = []
//        for num in m...n {
//            var isPrime = true
//            if num == 1 {
//                continue
//            }
//            for i in 2..<num {
//                if num % i == 0 {
//                    isPrime.toggle()
//                    break
//                }
//            }
//            if isPrime { primeNumbers.append(num) }
//        }
//        if primeNumbers.isEmpty {
//            print(-1)
//        } else {
//            print(primeNumbers.reduce(0,+))
//            print(primeNumbers[0])
//        }
        
        /// 에라토스테네스의 체 알고리즘
        /// 가장 먼저 소수를 판별할 범위만큼 배열을 할당하여, 소수가 아닌 값을 하나씩 체크해나가는 알고리즘
        var checker = Array(repeating: true, count: 10001)
        checker[0] = false
        checker[1] = false

        /// 2부터 시작해서 그 수의 배수에 해당하는 수(소수가 아닌 수)를 모두 체크한다.
        /// 지울 때 자기자신은 지우지 않고, 이미 지워진 수는 건너뛴다.
        for i in 2...10000 {
            if !checker[i] { continue } /// 이미 체크한 수라면 건너뛰기
            
            /// i를 제외한 i의 배수들을 체크한다.
            for j in stride(from: 2*i, through: 10000, by: i) {
                checker[j] = false
            }
        }

        let n = Int(readLine()!)!
        let m = Int(readLine()!)!
        var s = 0
        var minValue = 10001

        for number in n...m {
            if checker[number] {
                s += number
                minValue = min(minValue, number)
            }
        }
        if s == 0 {
            print(-1)
        } else{
            print(s)
            print(minValue)
        }
    }
}
