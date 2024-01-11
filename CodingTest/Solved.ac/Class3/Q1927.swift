//
//  Q1927.swift
//  CodingTest
//
//  Created by 이은재 on 12/16/23.
//https://www.acmicpc.net/problem/1927

import Foundation

struct Q1927: Template {
    struct MinHeap<T: Comparable> {
        private var array: [T] = []
        var isEmpty: Bool { return array.count <= 1 }
        
        mutating func insert(_ value: T) {
            if array.isEmpty {
                /// 빈 배열인 경우 1번 인덱스부터 루트 노드로 시작하기 위해서 인위적으로 값을 2개 넣어줌
                array.append(value)
                array.append(value)
                return
            }
            array.append(value)
            
            func moveUp(_ index: Int) -> Bool {
                if index <= 1 { return false }
                
                let parentIndex = index / 2
                return array[parentIndex] > array[index]
            }
            
            var insertIndex = array.count - 1
            while moveUp(insertIndex) {
                let parentIndex = insertIndex / 2
                array.swapAt(insertIndex, parentIndex)
                insertIndex = parentIndex
            }
        }
        
        enum MoveDownStatus {
            case none
            case left(index: Int)
            case right(index: Int)
        }
        
        @discardableResult
        mutating func remove() -> T? {
            if self.isEmpty { return nil }
            
            let removeValue = array[1]
            array.swapAt(1, array.count - 1)
            array.removeLast()
            
            func moveDown(_ parentIndex: Int) -> MoveDownStatus {
                let leftChildIdx = parentIndex * 2
                let rightChildIdx = leftChildIdx + 1
                
                /// 1. 자식 노드가 없는 경우
                if leftChildIdx >= array.count { return .none }
                /// 2. 왼쪽 자식 노드만 있는 경우
                if rightChildIdx >= array.count {
                    return array[parentIndex] > array[leftChildIdx] ? .left(index: leftChildIdx) : .none
                }
                /// 3. 왼쪽, 오른쪽 자식 노드 모두 있는 경우
                /// 3-1. 부모 노드가 자식 노드보다 값이 작은 경우
                if array[leftChildIdx] > array[parentIndex] && array[rightChildIdx] > array[parentIndex] {
                    return .none
                }
                /// 3-2. 자식들 중 하나라도 부모 노드보다 값이 작은 경우
                if array[parentIndex] > array[leftChildIdx] || array[parentIndex] > array[rightChildIdx] {
                    return array[leftChildIdx] > array[rightChildIdx] ? .right(index: rightChildIdx) : .left(index: leftChildIdx)
                }
                return .none
            }
            
            var removeIndex = 1
            while true {
                switch moveDown(removeIndex) {
                case .none:
                    return removeValue
                case .left(let index), .right(let index):
                    array.swapAt(removeIndex, index)
                    removeIndex = index
                }
            }
        }
    }
    
    static func solution() {
       
        let n = Int(readLine()!)!
        var heap = MinHeap<Int>()

        for _ in 0..<n {
            let x = Int(readLine()!)!
            if x == 0 {
                if let value = heap.remove() {
                    print(value)
                } else {
                    print(0)
                }
            } else {
                heap.insert(x)
            }
        }
    }
}
