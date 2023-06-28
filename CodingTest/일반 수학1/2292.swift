//
//  2292.swift
//  CodingTest
//
//  Created by 이은재 on 2023/06/28.
//

import Foundation
class Q2292{
    static func solution() {
        let n = Int(readLine()!)!
        
        var k=0, count = 1 // 생성된 방의 수, 겹의 수
        while n > k {
            count+=1
            k+=count*6
        }
        n == 1 ? print(1) : print(count)
    }
}
