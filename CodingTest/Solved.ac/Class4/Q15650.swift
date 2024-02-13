//
//  Q15650.swift
//  CodingTest
//
//  Created by 이은재 on 2/13/24.
//https://www.acmicpc.net/problem/15650

struct Q15650: Template {
    static func solution() {
        let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
        let (n, m) = (nm[0], nm[1])
        let numbers = (1...n).map { $0 }
        
        dfs(i: 0, arr: [Int](), size: 0)
        
        func dfs(i: Int, arr: [Int], size: Int) {
            if size == m {
                for v in arr {
                    print(v, terminator: " ")
                }
                print()
                return
            }
            
            if i == n { return }
            
            dfs(i: i + 1, arr: arr + [numbers[i]], size: size + 1)
            dfs(i: i + 1, arr: arr, size: size)
        }
    }
}
