//
//  Q1011.swift
//  CodingTest
//
//  Created by 이은재 on 2/21/24.
//https://www.acmicpc.net/problem/1011
import Foundation

struct Q1011: Template {
    static func solution() {
        let T = Int(readLine()!)!
        
        var answer = ""
        for _ in 0..<T {
            let xy = readLine()!.split(separator: " ").map { Int(String($0))! }
            let (x, y) = (xy[0], xy[1])
            
            let distance = y - x
            let sqrt = sqrt(Double(distance))
            if Int(sqrt) < Int(ceil(sqrt)) {
                answer += "\(Int(sqrt * 2))\n"
            } else {
                answer += "\(Int(sqrt * 2 - 1))\n"
            }
        }
        print(answer)
    }
}
