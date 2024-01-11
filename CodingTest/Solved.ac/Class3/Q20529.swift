//
//  Q20529.swift
//  CodingTest
//
//  Created by 이은재 on 1/5/24.
//https://www.acmicpc.net/problem/20529

import SwiftUI

struct Q20529: Template {
    static func solution() {
        let T = Int(readLine()!)!
        for _ in 0..<T {
            let N = Int(readLine()!)!
            let MBTI = readLine()!.split(separator: " ").map { $0.map { String($0) } }
            
            /// mbti는 총 16가지 유형이 있으므로 17명 이상이라면 반드시 2명은 겹치고,
            /// 33명 이상이라면 반드시 3명 이상은 겹친다. 따라서 33명 이상이라면, 반드시 0이 나온다.
            if N > 32 {
                print(0)
                continue
            }
            
            var result = 12
            for i in 0..<N {
                for j in i+1..<N {
                    for k in j+1..<N {
                        var cnt = 0
                        for s in 0..<4 {
                            cnt += MBTI[i][s] != MBTI[j][s] ? 1 : 0
                            cnt += MBTI[i][s] != MBTI[k][s] ? 1 : 0
                            cnt += MBTI[j][s] != MBTI[k][s] ? 1 : 0
                        }
                        result = min(result, cnt)
                        if result == 0 { break }
                    }
                }
            }
            print(result)
        }
    }
}
