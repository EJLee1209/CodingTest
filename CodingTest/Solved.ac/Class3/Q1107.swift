//
//  Q1107.swift
//  CodingTest
//
//  Created by 이은재 on 12/13/23.
//

import Foundation

struct Q1107: Template {
    static func solution() {
        let n = Int(readLine()!)!
        let m = Int(readLine()!)!
        var arr: [Int] = []
        if m > 0 {
            arr = readLine()!.split(separator: " ").map { Int(String($0))! }
        }
        
        var minCnt = abs(n - 100) // + 또는 -만 눌렀을 때
        for i in 0...1_000_000 {
            /// 수빈이가 이동하려고 하는 최대 채널을 500,000 이지만,
            /// 채널이 무한대만큼 있다는 힌트를 보고 생각해보면 500,000 보다 큰 수에서 뺄수도 있다는 것임.
            /// 극단적으로 생각해보면, 1에서 500,000으로 가는 것보다 999,000 에서 500,000 으로 가는게 더 빠름
            /// 그렇기 때문에 0에서 500,000 가는 경우와 1,000,000 에서 500,000을 가는 경우를 모두 고려해야함.
            let len = check(i)
            if len > 0 {
                let press = abs(n - i) // + 또는 - 버튼을 눌렀을 때의 경우
                minCnt = min(minCnt, len + press)
            }
        }
        
        print(minCnt)
        
        /// 이동하려는 채널의 리모콘 클릭횟수
        func check(_ i: Int) -> Int {
            var n = i
            /// n이 0이면, 0번으로 이동한다는 말인데, 0버튼이 부셔졌으면 0을 리턴 아니면 1을 리턴
            if n == 0 {
                if arr.contains(0) {
                    return 0
                }
                return 1
            }
            
            var len = 0
            /// n에서 누를 번호가 고장났는지를 판단해서 고장났으면 못누르니까 0 리턴
            /// 고장안났으면 누를거니까 len에 +1
            while n > 0 {
                if arr.contains(n % 10) { return 0 }
                n = n / 10
                len += 1
            }
            return len
        }
    }
}
