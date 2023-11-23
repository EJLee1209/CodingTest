//
//  File.swift
//  CodingTest
//
//  Created by 이은재 on 2023/06/27.
//

import Foundation
class Q25206{
    static func solution() {
        var sum = 0.0
        var totalPoint = 0.0
        (1...20).forEach { _ in
            let input = readLine()!.split(separator: " ").map{ String($0) }
            let point = Double(input[1])!, score = input[2] // 학점, 평점
            if score != "P"{
                totalPoint += point
            }
            switch score {
            case "A+":
                sum += point * 4.5
            case "A0":
                sum += point * 4.0
            case "B+":
                sum += point * 3.5
            case "B0":
                sum += point * 3.0
            case "C+":
                sum += point * 2.5
            case "C0":
                sum += point * 2.0
            case "D+":
                sum += point * 1.5
            case "D0":
                sum += point * 1.0
            default:
                break
            }
            
        }
        print(sum / totalPoint)
    }
}
