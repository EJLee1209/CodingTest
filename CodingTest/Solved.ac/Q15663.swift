//
//  Q15663.swift
//  CodingTest
//
//  Created by 이은재 on 2/19/24.
//https://www.acmicpc.net/problem/15663

struct Q15663: Template {
    static func solution() {
        let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
        let (n, m) = (nm[0], nm[1])
        let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()
        
        var visited = Array(repeating: false, count: n)
        var a = Set<String>()
        dfs(sequence: "", count: 0)
        
        func dfs(sequence: String, count: Int) {
            if count == m {
                if !a.contains(sequence) {
                    print(sequence)
                }
                a.insert(sequence)
                return
            }
            
            for i in 0..<n where !visited[i] {
                visited[i] = true
                dfs(sequence: sequence + "\(numbers[i]) ", count: count + 1)
                visited[i] = false
            }
        }
    }
}
