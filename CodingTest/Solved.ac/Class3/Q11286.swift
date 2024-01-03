//
//  Q11286.swift
//  CodingTest
//
//  Created by 이은재 on 12/30/23.
//https://www.acmicpc.net/problem/11286

import Foundation

struct Q11286: Template {
    
    struct Pair: Comparable {
        let absolute: Int
        let origin: Int
        
        init(_ n: Int) {
            self.absolute = abs(n)
            self.origin = n
        }
        
        static func < (lhs: Pair, rhs: Pair) -> Bool {
            if lhs.absolute == rhs.absolute {
                return lhs.origin < rhs.origin
            } else {
                return lhs.absolute < rhs.absolute
            }
        }
    }
    
    struct MinHeap {
        private var heap: [Pair] = []
        
        var isEmpty: Bool { return heap.count <= 1 }
        
        mutating func insert(_ value: Pair) {
            if heap.count == 0 {
                heap.append(value)
                heap.append(value)
                return
            }
            heap.append(value)
            
            func moveUp(_ insertIdx: Int) -> Bool {
                let parentIdx = insertIdx / 2
                return parentIdx >= 1 && heap[parentIdx] > heap[insertIdx]
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
        
        mutating func pop() -> Pair? {
            if isEmpty { return nil }
            
            let popValue = heap[1]
            heap.swapAt(1, heap.count - 1)
            heap.removeLast()
            
            func moveDown(_ idx: Int) -> MoveDownStatus {
                let leftChildIdx = idx * 2
                let rightChildIdx = leftChildIdx + 1
                
                /// 1. 자식 노드 없음
                if leftChildIdx >= heap.count {
                    return .none
                }
                /// 2. 왼쪽 자식만 있음
                if rightChildIdx >= heap.count {
                    return heap[idx] > heap[leftChildIdx] ? .left(index: leftChildIdx) : .none
                }
                /// 3. 왼쪽, 오른쪽 자식 둘 다 있음
                ///  3-1. 부모 노드의 값이 가장 작음
                if heap[leftChildIdx] > heap[idx] && heap[rightChildIdx] > heap[idx] {
                    return .none
                }
                ///  3-2. 자식 노드 중 하나만 부모 노드보다  작음
                if heap[leftChildIdx] < heap[idx] || heap[rightChildIdx] < heap[idx] {
                    return heap[leftChildIdx] > heap[rightChildIdx] ? .right(index: rightChildIdx) : .left(index: leftChildIdx)
                }
                ///  3-3. 자식 노드 둘 다 부모 노드보다  작음
                if heap[leftChildIdx] < heap[idx] && heap[rightChildIdx] < heap[idx] {
                    return heap[leftChildIdx] > heap[rightChildIdx] ? .right(index: rightChildIdx) : .left(index: leftChildIdx)
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
        var heap = MinHeap()
        for _ in 0..<n {
            let x = Int(readLine()!)!
            
            if x == 0 {
                if let pair = heap.pop() {
                    print(pair.origin)
                } else {
                    print(0)
                }
            } else {
                heap.insert(Pair(x))
            }
        }
    }
}
