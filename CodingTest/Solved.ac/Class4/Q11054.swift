//
//  Q11054.swift
//  CodingTest
//
//  Created by 이은재 on 2/12/24.
//

struct Q11054: Template {
    static func solution() {
        let n = Int(readLine()!)!
        var a = Array(repeating: 1, count: n)
        var b = Array(repeating: 1, count: n)
        let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
        
        for i in 0..<n {
            for j in 0..<i where numbers[i] > numbers[j] {
                a[i] = max(a[i], a[j] + 1)
            }
        }
        
        for i in stride(from: n - 2, through: 0, by: -1){
            for j in i+1..<n where numbers[i] > numbers[j] {
                b[i] = max(b[i], b[j] + 1)
            }
        }
        
        var answer = 1
        for i in 0..<n-1 {
            for j in i+1..<n where numbers[i] > numbers[j] {
                answer = max(answer, a[i] + b[j])
            }
        }
        
        print(answer)
    }
}

