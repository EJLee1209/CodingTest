//
//  2745.swift
//  CodingTest
//
//  Created by 이은재 on 2023/06/28.
//

import Foundation
class Q2745{
    static func solution() {
        // 내가 작성한 코드
        // 근데 채점해보면 틀렸다고 나옴
//        // A~Z까지의 대응되는 수
//        var dict = [String:Int]()
//        var keyAscii = 65 // A의 아스키 코드
//        (10...35).forEach { value in
//            let key = String(UnicodeScalar(keyAscii)!)
//            dict[key] = value
//            keyAscii+=1
//        }
//        // 입력
//        let nb = readLine()!.split(separator: " ").map{ String($0) }
//        let n = nb[0].map{ String($0) }, b = Decimal(string: nb[1])!
//        // 10진법으로 계산
//        var result : Decimal = 0.0
//        for (idx, s) in n.enumerated() {
//            if let number = Decimal(string: s) {
//                // 숫자
//                result += number * pow(b, n.count-idx-1)
//            } else {
//                // 문자
//                result += Decimal(dict[s]!) * pow(b, n.count-idx-1)
//            }
//        }
//        print(result)
        
        // 구글링한 코드
        // 진법 변환해주는 메서드가 있었음..................
        let nb = readLine()!.split(separator: " ").map{ String($0) }
        let n = nb[0], b = Int(nb[1])!
        print(Int(n, radix: b)!)
    }
}
