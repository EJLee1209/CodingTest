//
//  Q1238.swift
//  CodingTest
//
//  Created by 이은재 on 1/11/24.
//https://www.acmicpc.net/problem/1238

import Foundation

struct Q1238: Template {
    struct Edge: Comparable {
        var node: Int
        var time: Int
        
        static func < (lhs: Q1238.Edge, rhs: Q1238.Edge) -> Bool {
            return lhs.time < rhs.time
        }
    }
    
    struct MinHeap<T: Comparable> {
        enum HeapType {
            case min, max
        }
        
        private var heap: [T] = []
        private var compare: (T, T) -> Bool = { $0 < $1 }
        
        init() {}
        
        init(type: HeapType) {
            switch type {
            case .min:
                compare = { $0 < $1 }
            case .max:
                compare = { $0 > $1 }
            }
        }
        
        var isEmpty: Bool { heap.count <= 1 }
        
        mutating func insert(_ value: T) {
            if heap.isEmpty {
                heap.append(value)
                heap.append(value)
                return
            }
            heap.append(value)
            
            func moveUp(_ index: Int) -> Bool {
                return index > 1 && heap[index / 2] > heap[index]
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
            case left
            case right
        }
        
        mutating func remove() -> T? {
            if self.isEmpty { return nil }
            
            let removeValue = heap[1]
            heap.swapAt(1, heap.count - 1)
            heap.removeLast()
            
            func moveDown(_ idx: Int) -> MoveDownStatus {
                let leftChildIdx = idx * 2
                let rightChildIdx = leftChildIdx + 1
                
                // 자식이 없는 경우
                if leftChildIdx > heap.count - 1 {
                    return .none
                }
                // 왼쪽 자식만 있는 경우
                if rightChildIdx > heap.count - 1 {
                    return heap[idx] > heap[leftChildIdx] ? .left : .none
                }
                // 왼쪽, 오른쪽 자식 둘 다 있는 경우
                
                // 1. 부모 값이 제일 작은 경우
                if heap[leftChildIdx] > heap[idx] && heap[rightChildIdx] > heap[idx] {
                    return .none
                }
                
                // 2. 자식 둘 중 하나라도 부모 노드 보다 작은 경우
                if heap[idx] > heap[leftChildIdx] || heap[idx] > heap[rightChildIdx] {
                    return heap[leftChildIdx] > heap[rightChildIdx] ? .right : .left
                }
                
                return .none
            }
            
            var removeIdx = 1
            
            while true {
                switch moveDown(removeIdx) {
                case .none:
                    return removeValue
                case .left:
                    let leftChildIdx = removeIdx * 2
                    heap.swapAt(leftChildIdx, removeIdx)
                    removeIdx = leftChildIdx
                case .right:
                    let rightChildIdx = removeIdx * 2 + 1
                    heap.swapAt(rightChildIdx, removeIdx)
                    removeIdx = rightChildIdx
                }
            }
        }
    }
    
    static func solution() {
        
        let nmx = readLine()!.split(separator: " ").map { Int(String($0))! }
        let (n, m, x) = (nmx[0], nmx[1], nmx[2])
        var graph: [Int: [Edge]] = [:]
        var reverseGraph: [Int: [Edge]] = [:]
        
        (1...n).forEach {
            graph[$0] = []
            reverseGraph[$0] = []
        }
        
        for _ in 0..<m {
            let input = readLine()!.split(separator: " ").map { Int(String($0))! }
            graph[input[0]]!.append(Edge(node: input[1], time: input[2]))
            reverseGraph[input[1]]!.append(Edge(node: input[0], time: input[2]))
        }
        
        func dijkstra(_ graph: [Int: [Edge]]) -> [Int] {
            var heap = MinHeap<Edge>()
            heap.insert(Edge(node: x, time: 0))
            var dist = Array(repeating: 0, count: n + 1)
            var visited = Array(repeating: false, count: n + 1)
            
            while !heap.isEmpty {
                let edge = heap.remove()!
                if visited[edge.node] { continue }
                
                visited[edge.node] = true
                dist[edge.node] = edge.time
                
                for nextEdge in graph[edge.node]! {
                    let time = edge.time + nextEdge.time
                    heap.insert(Edge(node: nextEdge.node, time: time))
                }
            }
            return dist
        }
        
        let xToAllDist = dijkstra(graph)
        let allToX = dijkstra(reverseGraph)
        
        var result = 0
        for i in 1...n {
            result = max(xToAllDist[i] + allToX[i], result)
        }
        print(result)
    }
}
