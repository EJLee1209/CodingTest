//
//  2751.swift
//  CodingTest
//
//  Created by 이은재 on 11/23/23.
//

import Foundation

struct Q2751: Template {
    static func solution() {
        let n = Int(readLine()!)!
        var numbers: [Int] = []
        for _ in 0..<n {
            let num = Int(readLine()!)!
            numbers.append(num)
        }
        
//        numbers.bubbleSort { $0 < $1 }
//        numbers.insertionSort { $0 < $1 }
//        numbers = quickSort(numbers)
        numbers = mergeSort(numbers)
        numbers.forEach { print($0) }
    }
    
    /// 퀵 정렬
    static func quickSort(_ array: [Int]) -> [Int] {
        guard let pivot = array.first, array.count > 1 else { return array }
        
        let left = array.filter { $0 < pivot }
        let right = array.filter { $0 > pivot }
        
        return quickSort(left) + [pivot] + quickSort(right)
    }
    
    /// 합병 정렬
    static func mergeSort(_ array: [Int]) -> [Int] {
        if array.count <= 1 { return array }
        let mid = array.count / 2
        let left = Array(array[0..<mid])
        let right = Array(array[mid..<array.count])
        
        func merge(_ left: [Int], _ right: [Int]) -> [Int] {
            var leftIdx = 0
            var rightIdx = 0
            var result: [Int] = []
            
            while leftIdx < left.count && rightIdx < right.count {
                if left[leftIdx] > right[rightIdx] {
                    result.append(right[rightIdx])
                    rightIdx += 1
                } else {
                    result.append(left[leftIdx])
                    leftIdx += 1
                }
            }
            
            if leftIdx < left.count {
                result.append(contentsOf: left[leftIdx..<left.count])
            }
            
            if rightIdx < right.count {
                result.append(contentsOf: right[rightIdx..<right.count])
            }
            
            return result
        }
        
        return merge(mergeSort(left), mergeSort(right))
    }
}


private extension Array where Element: Comparable {
    /// 삽입정렬
    mutating func insertionSort(by: (Element, Element) -> Bool) {
        guard self.count > 1 else { return }
        
        for i in 1..<self.count {
            for j in stride(from: i, to: 0, by: -1) {
                if !by(self[j-1], self[j]) {
                    swapAt(j-1, j)
                } else {
                    break
                }
            }
        }
    }
    /// 버블정렬
    mutating func bubbleSort(by: (Element, Element) -> Bool) {
        guard self.count > 1 else { return }
        
        for i in 1..<self.count {
            for j in 0..<self.count-i {
                if !by(self[j], self[j+1]) {
                    swapAt(j, j+1)
                }
            }
        }
    }
}
