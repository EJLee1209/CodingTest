//
//  9506.swift
//  CodingTest
//
//  Created by 이은재 on 2023/06/30.
//

import Foundation
class Q9506{
    static func solution() {
        while true {
            let n = Int(readLine()!)!
            if n == -1 { break }
            var result = [Int]()
            for i in 1..<n {
                if n % i == 0{
                    result.append(i)
                }
            }
            if result.reduce(0,+) == n {
                print("\(n) = ",terminator: "")
                print(result.map{ String($0) }.joined(separator: " + "))
            } else {
                print("\(n) is NOT perfect.")
            }
        }
    }
    
    
}
