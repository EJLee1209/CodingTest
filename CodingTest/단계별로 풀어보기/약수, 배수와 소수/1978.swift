//
//  1978.swift
//  CodingTest
//
//  Created by 이은재 on 2023/06/30.
//

import Foundation
class Q1978{
    static func solution() {
        let _ = readLine()
        let numbers = readLine()!.split(separator: " ").map{ Int(String($0))! }
        
        var primeNumbers = [Int]()
        numbers.forEach { a in
            if a > 1 {
                var isPrime = true
                for i in 2..<a/2+1 {
                    if a % i == 0 {
                        isPrime.toggle()
                        break
                    }
                }
                if isPrime { primeNumbers.append(a) }
            }
        }
        print(primeNumbers.count)
    }
}
