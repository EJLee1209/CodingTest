//
//  10811.swift
//  CodingTest
//
//  Created by 이은재 on 2023/06/26.
//

import Foundation
class Q10811{
    static func solution() {
        // 내가 작성한 코드
//        let nm = readLine()!.split(separator: " ").map{ Int(String($0))! }
//        var basket = Array(repeating: 0, count: nm[0])
//        for i in 1...nm[0] { basket[i-1] = i }
//        for _ in 0..<nm[1] {
//            let ij = readLine()!.split(separator: " ").map{ Int(String($0))! }
//            basket[ij[0]-1..<ij[1]].reverse()
//        }
//        print(basket.map{ "\($0)" }.joined(separator: " "))
        
        // 구글링한 코드
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        let n = input[0], m = input[1]

        var basket = [Int](0...n) // 0~n 배열 초기화

        for _ in 0..<m {
            let input = readLine()!.split(separator: " ").map { Int($0)! }
            var start = input[0], end = input[1]
            // 정해진 범위 내에서 처음과 마지막을 바꿈. 반복 -> 역순
            while start < end {
                basket.swapAt(start, end) // Array.swapAt(i,j) : 배열에서 i번째, j번째 요소를 바꾸는 메서드
                start += 1
                end -= 1
            }
        }

        basket[1...].forEach { print($0, terminator: " ") }
        // basket[1...] : 배열의 1번째부터 끝까지
    }
}
