//
//  Q1629.swift
//  CodingTest
//
//  Created by 이은재 on 1/13/24.
//https://www.acmicpc.net/problem/1629

import Foundation

struct Q1629: Template {
    static func solution() {
        let ABC = readLine()!.split(separator: " ").map { Int($0)! }

        let A = ABC[0]
        let B = ABC[1]
        let C = ABC[2]

        func recursion(N: Int) -> Int {
          if N == 0 { return 1 }
          
          if N % 2 == 0 {
            let r = recursion(N: N/2)
            return r % C * r % C
          } else {
            let r = recursion(N: (N - 1)/2)
            return r % C * r % C * A % C
          }
        }

        print(recursion(N: B))
    }
}
