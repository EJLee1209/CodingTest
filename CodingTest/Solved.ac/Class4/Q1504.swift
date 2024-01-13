//
//  Q1504.swift
//  CodingTest
//
//  Created by 이은재 on 1/12/24.
//https://www.acmicpc.net/problem/1504

import Foundation

struct Q1504: Template {
    struct Edge: Comparable {
        var node: Int
        var distance: Int
        
        static func < (lhs: Edge, rhs: Edge) -> Bool {
            return lhs.distance < rhs.distance
        }
    }
    
    struct Heap<T: Comparable> {
        enum HeapType { case min, max }
        
        private var heap: [T] = []
        private var compare: (T, T) -> Bool
        
        var isEmpty: Bool { return heap.count <= 1 }
        
        init(type: HeapType) {
            switch type {
            case .min:
                compare = { $0 < $1 }
            case .max:
                compare = { $0 > $1 }
            }
        }
        
        mutating func insert(_ value: T) {
            if heap.isEmpty {
                heap.append(value)
                heap.append(value)
                return
            }
            heap.append(value)
            
            func moveUp(_ index: Int) -> Bool {
                return index > 1 && compare(heap[index], heap[index / 2])
            }
            var insertIdx = heap.count - 1
            while moveUp(insertIdx) {
                let parentIdx = insertIdx / 2
                heap.swapAt(parentIdx, insertIdx)
                insertIdx = parentIdx
            }
        }
        
        enum MoveDownStatus { case none, left, right }
        
        mutating func remove() -> T? {
            if isEmpty { return nil }
            
            let removeValue = heap[1]
            heap.swapAt(1, heap.count - 1)
            heap.removeLast()
            
            func moveDown(_ index: Int) -> MoveDownStatus {
                let leftChildIndex = index * 2
                let rightChildIndex = leftChildIndex + 1
                
                // 자식이 없는 경우
                if leftChildIndex > heap.count - 1 {
                    return .none
                }
                // 왼쪽 자식만 있는 경우
                if rightChildIndex > heap.count - 1 {
                    return compare(heap[leftChildIndex], heap[index]) ? .left : .none
                }
                // 자식 둘 다 있는 경우
                if compare(heap[index], heap[leftChildIndex]) && compare(heap[index], heap[rightChildIndex]) {
                    return .none
                }
                
                return compare(heap[leftChildIndex], heap[rightChildIndex]) ? .left : .right
            }
            
            var removeIndex = 1
            while true {
                switch moveDown(removeIndex) {
                case .none:
                    return removeValue
                case .left:
                    let leftChildIndex = removeIndex * 2
                    heap.swapAt(leftChildIndex, removeIndex)
                    removeIndex = leftChildIndex
                case .right:
                    let rightChildIndex = removeIndex * 2 + 1
                    heap.swapAt(rightChildIndex, removeIndex)
                    removeIndex = rightChildIndex
                }
            }
        }
    }
    
    static func solution() {
        let ne = readLine()!.split(separator: " ").map { Int(String($0))! }
        let (N, E) = (ne[0], ne[1])
        var graph: [Int: [Edge]] = [:]
        (1...N).forEach { graph[$0] = [] }
        
        for _ in 0..<E {
            let input = readLine()!.split(separator: " ").map { Int(String($0))! }
            let (a, b, c) = (input[0], input[1], input[2])
            graph[a]!.append(Edge(node: b, distance: c))
            graph[b]!.append(Edge(node: a, distance: c))
        }
        
        let V = readLine()!.split(separator: " ").map { Int(String($0))! }
        let (v1, v2) = (V[0], V[1])
        
        func shortestDistance(_ startNode: Int, _ endNode: Int) -> Int {
            var heap = Heap<Edge>(type: .min)
            heap.insert(Edge(node: startNode, distance: 0))
            var visited = Array(repeating: false, count: N + 1)
            
            while !heap.isEmpty {
                let edge = heap.remove()!
                
                if visited[edge.node] { continue }
                visited[edge.node] = true
                
                if edge.node == endNode {
                    return edge.distance
                }
                
                for nextEdge in graph[edge.node]! {
                    let distance = edge.distance + nextEdge.distance
                    heap.insert(Edge(node: nextEdge.node, distance: distance))
                }
            }
            return -1
        }
        
        let oneToV1 = shortestDistance(1, v1)
        let v1ToV2 = shortestDistance(v1, v2)
        let v2ToN = shortestDistance(v2, N)
        
        let oneToV2 = shortestDistance(1, v2)
        let v1ToN = shortestDistance(v1, N)
        
        
        if (oneToV1 == -1 || v1ToV2 == -1 || v2ToN == -1) && (oneToV2 == -1 || v1ToV2 == -1 || v1ToN == -1) {
            print(-1)
        } else {
            let distance1 = oneToV1 + v1ToV2 + v2ToN
            let distance2 = oneToV2 + v1ToV2 + v1ToN
            
            print(min(distance1, distance2))
        }
    }
}
