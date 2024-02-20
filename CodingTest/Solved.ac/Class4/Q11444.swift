//
//  Q11444.swift
//  CodingTest
//
//  Created by 이은재 on 2/20/24.
//https://www.acmicpc.net/problem/11444

struct Q11444: Template {
    static func solution() {
        func multiply(matrix1: [[Int]], matrix2: [[Int]]) -> [[Int]] {
            var answer = [[Int]](repeating: [Int](repeating: 0, count: 2), count: 2)
            
            for i in 0..<2 {
                for j in 0..<2 {
                    for k in 0..<2 {
                        answer[i][j] += matrix1[i][k] * matrix2[k][j]
                        answer[i][j] %= 1_000_000_007
                    }
                }
            }
            return answer
        }


        func pow(matrix: [[Int]], k: Int) -> [[Int]] {
            if k == 1 {
                return matrix
            }
            
            if k % 2 != 0 {
                return multiply(matrix1: matrix, matrix2: pow(matrix: matrix, k: k - 1))
            }
            let half = pow(matrix: matrix, k: k / 2)
            return multiply(matrix1: half, matrix2: half)
        }

        let n = Int(readLine()!)!
        let fibo: [[Int]] = [[1, 1],
                             [1, 0]]

        print(pow(matrix: fibo, k: n)[0][1])
    }
}
