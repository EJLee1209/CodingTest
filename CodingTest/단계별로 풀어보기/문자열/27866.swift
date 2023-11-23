//
//  27866.swift
//  CodingTest
//
//  Created by 이은재 on 2023/06/26.
//

import Foundation
class Q27866{
    static func solution() {
        let s = readLine()!
        let i = Int(readLine()!)!
        print(s[i-1])
    }
}

/// Swift에서 문자열을 배열처럼 인덱스로 바로 접근하는 것은 불가능하기 때문에
/// Extension으로 subscript를 정의하면 좀 더 편리하게 문자열 인덱싱이 가능하다
private extension String {
    subscript(_ index: Int) -> Self {
        return String(self[self.index(startIndex, offsetBy: index)])
    }
}

