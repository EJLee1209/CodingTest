//
//  2480.swift
//  CodingTest
//
//  Created by 이은재 on 2023/06/24.
//

import Foundation
class Q2480{
    static func solution() {
        let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
        var dice = Array(repeating:0, count:7)
        input.forEach { n in
            dice[n] += 1
        }
        let maxCount = dice.max()! // 같은 눈이 나온 횟수
        let diceNumber = dice.firstIndex(of:maxCount)! // 같은 눈
        if maxCount == 1 { // 모두 다른 눈
            let bigNumber = dice.lastIndex(of: 1)!
            print(bigNumber*100)
        } else if maxCount == 2 { // 같은 눈 2개
            print(1000+diceNumber*100)
        } else { // 같은 눈 3개
            print(10000+diceNumber*1000)
        }
    }
}
