//
//  Q11047.swift
//  CodingTest
//
//  Created by 이은재 on 12/29/23.
//

import Foundation

struct Q11047: Template {
    static func solution() {
        let nk = readLine()!.split(separator: " ").map { Int($0)! }
        let (n, k) = (nk[0], nk[1])
        var A: [Int] = []
        for _ in 0..<n {
            A.append(Int(readLine()!)!)
        }
        A.sort { $0 > $1 }
        
        var cnt = 0
        func dfs(_ target: Int) {
            if target == 0 {
                print(cnt)
                return
            }
            
            for a in A {
                let aCnt = target / a
                if aCnt > 0 {
                    cnt += aCnt
                    dfs(target - aCnt * a)
                    break
                }
            }
        }
        
        dfs(k)
    }
}
