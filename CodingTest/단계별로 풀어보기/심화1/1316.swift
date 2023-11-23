//
//  1316'.swift
//  CodingTest
//
//  Created by 이은재 on 2023/06/27.
//

import Foundation
class Q1316{
    static func solution() {
        // 내가 작성한 코드
//        let n = Int(readLine()!)!
//        var count = 0
//        for _ in 0..<n {
//            let s = readLine()!.map{ String($0) }
//            var arr = [String]()
//            var previous = ""
//
//            for ch in s {
//                if ch == previous {
//                    continue
//                } else {
//                    if arr.contains(ch) {
//                        count+=1
//                        break
//                    }
//                    arr.append(ch)
//                }
//                previous = ch
//            }
//        }
//        print(n-count)
        // 구글링한 코드
        // 스택을 사용한 접근 방식
        let n = Int(readLine()!)!
        var answer = 0
        (1...n).forEach { _ in
            let word = readLine()!
            var stack: [Character] = []
            word.forEach {
                if !stack.isEmpty && stack.last! == $0 {
                    stack.removeLast()
                }
                stack.append($0)
            }
            if Set(stack).count == stack.count {
                answer += 1
            }
        }
        print(answer)
    }
}
