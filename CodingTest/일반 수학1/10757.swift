//
//  10757.swift
//  CodingTest
//
//  Created by 이은재 on 2023/06/29.
//

import Foundation
class Q10757{
    static func solution() {
        let ab = readLine()!.split(separator: " ").map{ String($0) }
        let A = Array(ab[0]), B = Array(ab[1])
        
        var result: [Int]
        var size: Int
        let diff = abs(A.count - B.count)
        if A.count >= B.count {
            result = A.map{ Int(String($0))! }
            for i in 0..<B.count {
                result[i+diff] += Int(String(B[i]))!
            }
            
        } else {
            result = B.map{ Int(String($0))! }
            for i in 0..<A.count {
                result[i+diff] += Int(String(A[i]))!
            }
        }
        
        for i in stride(from: result.count-1, to: 0, by: -1) {
            if result[i] >= 10 {
                result[i-1]+=1
                result[i]-=10
            }
        }
        print(result.map{ String($0) }.joined())
    }
}
