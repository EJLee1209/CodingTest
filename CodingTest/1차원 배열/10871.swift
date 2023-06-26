//
//  10871.swift
//  CodingTest
//
//  Created by 이은재 on 2023/06/25.
//

import Foundation
class Q10871{
    static func solution() {
        // 내가 작성한 코드
//        let input = readLine()!.split(separator: " ").map{ Int($0)! }
//        let _ = readLine()!.split(separator: " ")
//            .map{
//                let v = Int($0)!
//                if v < input[1] { print(v, terminator: " ") }
//            }
        
        // 구글링한 코드
        
        let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
        print(
            readLine()!
                .split(separator: " ")
                .map{ Int(String($0))! }
                .filter{ $0 < input[1] }
                .map{ "\($0)" }
                .joined(separator: " ") // : 문자열 배열을 하나의 문자열로 합쳐주는 메서드, 문자 사이에 공백을 위해 separator를 " "로 설정
        )
        
    }
}
