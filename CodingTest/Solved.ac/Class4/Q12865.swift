//
//  Q12865.swift
//  CodingTest
//
//  Created by 이은재 on 1/31/24.
//https://www.acmicpc.net/problem/12865

struct Q12865: Template {
    static func solution() {
        let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
        let (n, k) = (nk[0], nk[1])
        var dp = Array(repeating: Array(repeating: 0, count: n + 1), count: k + 1)
        var items = [[0, 0]]
        
        for _ in 0..<n {
            let wv = readLine()!.split(separator: " ").map { Int(String($0))! }
            items.append(wv)
        }
        
        for i in 1...k {
            for j in 1...n {
                // 일단 이전 물건까지의 최대 가치를 기록
                dp[i][j] = dp[i][j - 1]
                
                let w = items[j][0]
                let v = items[j][1]
                // 현재 아이템을 담지 않았을 때의 최대 가치 VS 현재 아이템을 담고, 나머지 무게를 채워넣었을 때의 가치
                if i >= w {
                    dp[i][j] = max(dp[i][j], dp[i - w][j - 1] + v)
                }
            }
        }
        print(dp[k][n])
    }
}
