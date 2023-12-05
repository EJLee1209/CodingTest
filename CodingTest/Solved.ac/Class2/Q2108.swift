//
//  Q2108.swift
//  CodingTest
//
//  Created by 이은재 on 12/4/23.
//

import Foundation

struct Q2108: Template {
    static func solution() {
        let n = Int(readLine()!)!
        var numbers = [Int]()
        var countDict: [Int: Int] = [:]
        
        for _ in 0..<n {
            let num = Int(readLine()!)!
            numbers.append(num)
            if let _ = countDict[num] {
                countDict[num]! += 1
            } else {
                countDict[num] = 1
            }
        }
        
        numbers.sort()
        print(Int(round(Double(numbers.reduce(0, +)) / Double(n))))
        print(numbers[n/2])
        let maxCount = countDict.max(by: { $0.value < $1.value })?.value
        let maxCountValues = countDict.filter { $0.value == maxCount }.keys.sorted()
        if maxCountValues.count >= 2 {
            print(maxCountValues[1])
        } else {
            print(maxCountValues[0])
        }
        print(numbers.max()! - numbers.min()!)
    }
}
