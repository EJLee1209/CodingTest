//
//  Q15654.swift
//  CodingTest
//
//  Created by 이은재 on 2/18/24.
//https://www.acmicpc.net/problem/15654

struct Q15654: Template {
    static func solution() {
        let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
        let (n, m) = (nm[0], nm[1])
        let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()
        var visited = Array(repeating: false, count: n)
        
        var answer = ""
        dfs(sequence: "", count: 0)
        print(answer)
        
        func dfs(sequence: String, count: Int) {
            if count == m {
                answer += "\(sequence)\n"
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
