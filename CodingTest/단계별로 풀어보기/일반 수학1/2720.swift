//
//  2720.swift
//  CodingTest
//
//  Created by 이은재 on 2023/06/28.
//

import Foundation
class Q2720{
    static func solution() {
        let t = Int(readLine()!)!
        for _ in 1...t {
            var money = Int(readLine()!)!
            let quarter = money / 25
            money %= 25
            let dime = money / 10
            money %= 10
            let nickel = money / 5
            money %= 5
            let penny = money / 1
            
            print(quarter, dime, nickel, penny)
        }
    }
}
