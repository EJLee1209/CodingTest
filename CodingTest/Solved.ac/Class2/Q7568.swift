//
//  Q7568.swift
//  CodingTest
//
//  Created by 이은재 on 12/6/23.
//

import Foundation

struct Q7568: Template {
    static func solution() {
        let n = Int(readLine()!)!
        var arr: [(x: Int, y: Int)] = []
        
        for _ in 0..<n {
            let input = readLine()!.split(separator: " ").map { Int($0)! }
            let (x, y) = (input[0], input[1])
            arr.append((x,y))
        }
        
        for i in 0..<n {
            var k = 0 // i번째 사람보다 더 큰 덩치를 가진 사람의 수
            
            for j in 0..<n {
                if arr[j].x > arr[i].x && arr[j].y > arr[i].y { k+=1 }
            }
            print(k+1, terminator: " ")
        }
    }
}
