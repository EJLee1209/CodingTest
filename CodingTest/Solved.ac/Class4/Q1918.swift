//
//  Q1918.swift
//  CodingTest
//
//  Created by 이은재 on 1/16/24.
//

struct Q1918: Template {
    static func solution() {
        let infix = Array(readLine()!).map { String($0) }
        var stack = [String]()
        let operators = ["+": 1, "-": 1, "*": 2, "/": 2]
        var result = ""
        
        for c in infix {
            if c >= "A" && c <= "Z" { // 문자
                result.append(c)
                continue
            }
            
            if let priority = operators[c] {
                /// 연산자
                while !stack.isEmpty && stack.last! != "(" && operators[stack.last!]! >= priority {
                    result += stack.removeLast()
                }
                
                stack.append(c)
            } else {
                /// 괄호
                if c == "(" {
                    stack.append(c)
                    continue
                }
                while !stack.isEmpty && stack.last! != "(" {
                    result += stack.removeLast()
                }
                stack.removeLast()
            }
        }
        result.append(stack.reversed().joined())
        print(result)
    }
}
