//
//  3009.swift
//  CodingTest
//
//  Created by 이은재 on 2023/07/01.
//

import Foundation
class Q3009{
    static func solution() {
        // 내가 작성한 코드
//        var xList: [Int] = []
//        var yList: [Int] = []
//
//        for _ in 0..<3 {
//            let xy = readLine()!.split(separator: " ").map{ Int(String($0))! }
//            let x = xy[0], y = xy[1]
//
//            if xList.contains(x) {
//                xList.removeAll { $0 == x }
//            } else {
//                xList.append(x)
//            }
//            if yList.contains(y) {
//                yList.removeAll { $0 == y }
//            } else {
//                yList.append(y)
//            }
//        }
//        print("\(xList[0]) \(yList[0])")
        
        // 다른 방법
        /*
            직사각형의 같은 선분 상의 점은 x 또는 y가 같다는 규칙을 활용한 것은 동일하지만,
            이 방법이 좀 더 직관적으로 보임.
         */
        let a = readLine()!.split(separator: " ").map{ Int(String($0))! }
        let b = readLine()!.split(separator: " ").map{ Int(String($0))! }
        let c = readLine()!.split(separator: " ").map{ Int(String($0))! }
        var x = 0, y = 0
        
        if a[0] == b[0] {
            x = c[0]
        } else if a[0] == c[0] {
            x = b[0]
        } else {
            x = a[0]
        }
        
        if a[1] == b[1] {
            y = c[1]
        } else if a[1] == c[1] {
            y = b[1]
        } else {
            y = a[1]
        }
        
        print("\(x) \(y)")
    }
}
