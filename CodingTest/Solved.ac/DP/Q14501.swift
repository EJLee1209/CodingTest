//
//  Q14501.swift
//  CodingTest
//
//  Created by 이은재 on 3/7/24.
//https://www.acmicpc.net/problem/14501

struct Q14501: Template {
    static func solution() {
        let n = Int(readLine()!)!
        var T: [Int] = .init()
        var P: [Int] = .init()
        var answer = 0
        
        for _ in 0..<n {
            let tp = readLine()!.split(separator: " ").map { Int(String($0))! }
            T.append(tp[0])
            P.append(tp[1])
        }
        
        dfs(i: 0, remain: 0, income: 0)
        print(answer)
        
        func dfs(i: Int, remain: Int, income: Int) {
            if i >= n {
                answer = max(answer, income)
                return
            }
            
            if remain > 0 {
                dfs(i: i + 1, remain: remain - 1, income: income)
                return
            }
            if i + T[i] <= n {
                dfs(i: i + 1, remain: T[i] - 1, income: income + P[i])
            }
            dfs(i: i + 1, remain: 0, income: income)
        }
    }
}
