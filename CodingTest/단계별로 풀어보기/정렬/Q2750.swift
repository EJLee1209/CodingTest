//
//  Q2750.swift
//  CodingTest
//
//  Created by 이은재 on 11/22/23.
//

import Foundation
struct Q2750: Template {
    static func solution() {
        let n = Int(readLine()!)!
        var numbers: [Int] = []
        for _ in 0..<n {
            let num = Int(readLine()!)!
            numbers.append(num)
        }
        //numbers.insertionSort { $0 < $1 }
        numbers.bubbleSort { $0 < $1 }
        numbers.forEach { num in
            print(num)
        }

    }
}

private extension Array where Element: Comparable {
    /// O(n²)
    /// 삽입 정렬
    /// 클로저를 파라미터 인자로 받아 정렬 기준을 설정할 수 있음
    mutating func insertionSort(by: (Element, Element) -> Bool) {
        guard self.count > 1 else { return }
        
        for i in 1..<self.count {
            /// array[i]의 앞에서 array[i]의 적당한 위치를 찾아 삽입
            for j in stride(from: i, to: 0, by: -1) {
                if !by(self[j-1], self[j]) {
                    swapAt(j, j-1)
                } else {
                    break
                }
            }
        }
    }
    /// O(n²)
    /// 버블 정렬
    /// 두 인접한 데이터를 비교하여 파라미터로 받은 클로저의 조건에 부합하지 않으면, 두 요소를 재정렬한다.
    mutating func bubbleSort(by: (Element, Element) -> Bool) {
        guard self.count > 1 else { return }
        
        for i in 1..<self.count {
            for j in 0..<self.count - i {
                if !by(self[j], self[j+1]) {
                    swapAt(j, j+1)
                }
            }
        }
    }
}

