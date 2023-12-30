//
//  Q11279.swift
//  CodingTest
//
//  Created by 이은재 on 12/30/23.
//https://www.acmicpc.net/problem/11279

import Foundation

struct Q11279: Template {
    struct MaxHeap<T: Comparable> {
        private var heap: [T] = []
        
        var isEmpty: Bool { return heap.count <= 1 }
        
        mutating func insert(_ value: T) {
            if heap.count == 0 {
                heap.append(value)
                heap.append(value)
                return
            }
            heap.append(value)
            
            func moveUp(_ idx: Int) -> Bool {
                let parentIdx = idx / 2
                return parentIdx >= 1 && heap[idx] > heap[parentIdx]
            }
            
            var insertIdx = heap.count - 1
            while moveUp(insertIdx) {
                let parentIdx = insertIdx / 2
                heap.swapAt(insertIdx, parentIdx)
                insertIdx = parentIdx
            }
        }
        
        enum MoveDownStatus {
            case none
            case left(index: Int)
            case right(index: Int)
        }
        
        mutating func pop() -> T? {
            if isEmpty { return nil }
            
            let popValue = heap[1]
            heap.swapAt(1, heap.count - 1)
            heap.removeLast()
            
            func moveDown(_ idx: Int) -> MoveDownStatus {
                let leftChildIdx = idx * 2
                let rightChildIdx = leftChildIdx + 1
                
                /// 1. 자식 노드가 없는 경우
                if leftChildIdx >= heap.count {
                    return .none
                }
                /// 2. 왼쪽 자식 노드만 있는 경우
                if rightChildIdx >= heap.count {
                    return heap[leftChildIdx] > heap[idx] ? .left(index: leftChildIdx) : .none
                }
                /// 3. 자식 노드가 둘 다 있는 경우
                ///  3-1. 부모 노드 값이 자식 노드보다 큰 경우
                if heap[idx] > heap[leftChildIdx] && heap[idx] > heap[rightChildIdx] {
                    return .none
                }
                ///  3-2. 자식 노드 중 하나만 부모 노드보다 값이 큰 경우
                if heap[leftChildIdx] > heap[idx] || heap[rightChildIdx] > heap[idx] {
                    return heap[leftChildIdx] > heap[rightChildIdx] ? .left(index: leftChildIdx) : .right(index: rightChildIdx)
                }
                ///  3-3. 자식 노드 둘 다 부모 노드보다 값이 큰 경우
                if heap[leftChildIdx] > heap[idx] && heap[rightChildIdx] > heap[idx] {
                    return heap[leftChildIdx] > heap[rightChildIdx] ? .left(index: leftChildIdx) : .right(index: rightChildIdx)
                }
                
                return .none
            }
            
            var popIdx = 1
            while true {
                switch moveDown(popIdx) {
                case .none:
                    return popValue
                case let .left(childIdx), let .right(childIdx):
                    heap.swapAt(popIdx, childIdx)
                    popIdx = childIdx
                }
            }
        }
    }
    
    static func solution() {
        let n = Int(readLine()!)!
        var maxHeap = MaxHeap<Int>()
        
        for _ in 0..<n {
            let x = Int(readLine()!)!
            
            if x == 0 {
                if let popValue = maxHeap.pop() {
                    print(popValue)
                } else {
                    print(0)
                }
            }
            else if x > 0 {
                maxHeap.insert(x)
            }
        }
    }
}
