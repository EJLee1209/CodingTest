//
//  Q1759.swift
//  CodingTest
//
//  Created by 이은재 on 2/24/24.
//https://www.acmicpc.net/problem/1759

struct Q1759: Template {
    static func solution() {
        let lc = readLine()!.split(separator: " ").map { Int(String($0))! }
        let (L, C) = (lc[0], lc[1])
        let alpha = readLine()!.split(separator: " ").map { String($0) }.sorted()
        let vowelLetters = ["a", "e", "i", "o", "u"]
        
        dfs(i: 0, s: "", vowelCount: 0)
        
        func dfs(i: Int, s: String, vowelCount: Int) {
            if s.count == L {
                if vowelCount >= 1 && s.count - vowelCount >= 2 {
                    print(s)
                }
                return
            }
            
            if i >= C {
                return
            }
            
            let count = vowelLetters.contains(alpha[i]) ? vowelCount + 1 : vowelCount
            dfs(i: i + 1, s: s + alpha[i], vowelCount: count)
            dfs(i: i + 1, s: s, vowelCount: vowelCount)
        }
    }
}
