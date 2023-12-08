//
//  Q10814.swift
//  CodingTest
//
//  Created by 이은재 on 12/6/23.
//https://www.acmicpc.net/problem/10814

import Foundation

struct Q10814: Template {
    static func solution() {
        let n = Int(readLine()!)!
        var users = [(age: Int, name: String)]()
        for _ in 0..<n {
            let user = readLine()!.split(separator: " ")
            users.append((Int(user[0])!, String(user[1])))
        }
        users.sort { $0.age < $1.age }
        users.forEach { age, name in
            print(age, name)
        }
    }
}
