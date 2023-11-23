//
//  10807.swift
//  CodingTest
//
//  Created by 이은재 on 2023/06/25.
//

import Foundation
class Q10807{
    static func solution() {
        // 내가 작성한 코드
//        let n = Int(readLine()!)!
//        let array = readLine()!.split(separator: " ").map{ Int(String($0))! }
//        let v = Int(readLine()!)!
//        var count = 0
//        array.forEach { num in
//            if v == num { count += 1 }
//        }
//        print(count)
        
        // 구글링한 코드
        // 고차함수인 filter를 사용한 풀이
        // filter : 클로저 내부의 조건에 부합하는 요소들을 포함한 배열을 리턴
        let n = Int(readLine()!)!
        let array = readLine()!.split(separator: " ").map { Int($0)! }
        let v = Int(readLine()!)!
        print(array.filter { $0 == v }.count)
    }
}
