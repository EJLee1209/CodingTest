//
//  Q1927.swift
//  CodingTest
//
//  Created by 이은재 on 12/16/23.
//

import Foundation

struct Q1927: Template {
    struct MinHeap<T: Comparable> {
        var heap: [T] = []
        
        var isEmpty: Bool { return heap.count <= 1 }
        
        mutating func insert(_ element: T) {
            if isEmpty {
                heap.append(element)
                heap.append(element)
                return
            }
            heap.append(element)
            
            func moveUp(_ index: Int) -> Bool {
                if index <= 1 { return false }
                
                let parentIndex = index / 2
                return heap[parentIndex] > heap[index]
            }
            
            var insertIndex = heap.count - 1
            while moveUp(insertIndex) {
                let parentIndex = insertIndex / 2
                heap.swapAt(insertIndex, parentIndex)
                insertIndex = parentIndex
            }
        }
        
        enum MoveDownStatus { case left, right, none }
        
        mutating func pop() -> T? {
            if isEmpty { return nil }
            let popValue = heap[1]
            heap.swapAt(1, heap.count-1)
            heap.removeLast()
            
            func moveDown(_ parentIndex: Int) -> MoveDownStatus {
                let leftChildIndex = parentIndex * 2
                let rightChildIndex = leftChildIndex + 1
                
                /// case 1: 자식 노드가 없는 경우
                if leftChildIndex >= heap.count { return .none }
                /// case 2: 왼쪽 자식 노드만 있는 경우
                if rightChildIndex >= heap.count {
                    return heap[parentIndex] > heap[leftChildIndex] ? .left : .none
                }
                /// case 3: 왼쪽 오른쪽 자식 노드가 모두 있는 경우
                /// case 3-1: 부모 노드가 왼쪽, 오른쪽 자식 노드보다 값이 작은 경우
                if heap[leftChildIndex] > heap[parentIndex] && heap[rightChildIndex] > heap[parentIndex] {
                    return .none
                }
                /// case 3-2: 자식들이 부모 노드보다 값이 모두 작은 경우
                if heap[parentIndex] > heap[leftChildIndex] && heap[parentIndex] > heap[rightChildIndex] {
                    return heap[leftChildIndex] > heap[rightChildIndex] ? .right : .left
                }
                /// case 3-3: 자식 중, 한 자식만 부모 노드보다 값이 작은 경우
                if heap[parentIndex] > heap[leftChildIndex] || heap[parentIndex] > heap[rightChildIndex] {
                    return heap[leftChildIndex] > heap[rightChildIndex] ? .right : .left
                }
                
                return .none
            }
            
            var popIndex = 1
            while true {
                switch moveDown(popIndex) {
                case .none:
                    return popValue
                case .left:
                    let leftChildIndex = popIndex * 2
                    heap.swapAt(popIndex, leftChildIndex)
                    popIndex = leftChildIndex
                case .right:
                    let rightChildIndex = popIndex * 2 + 1
                    heap.swapAt(popIndex, rightChildIndex)
                    popIndex = rightChildIndex
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
                if let value = heap.pop() {
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
