//
//  Q1753.swift
//  CodingTest
//
//  Created by 이은재 on 1/13/24.
//https://www.acmicpc.net/problem/1753

import Foundation

struct Q1753: Template {
    struct Edge: Comparable {
        var node: Int
        var weight: Int
        
        static func < (lhs: Edge, rhs: Edge) -> Bool {
            return lhs.weight < rhs.weight
        }
    }
    
    struct Heap<T: Comparable> {
        enum HeapType { case min, max }
        
        private var heap: [T] = []
        private let compare: (T, T) -> Bool
        
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
            
            var insertIndex = heap.count - 1
            while insertIndex > 1 && compare(heap[insertIndex], heap[insertIndex / 2]) {
                let parentIndex = insertIndex / 2
                heap.swapAt(parentIndex, insertIndex)
                insertIndex = parentIndex
            }
        }
        
        enum MoveDownStatus { case none, left, right }
        
        mutating func remove() -> T? {
            if self.isEmpty { return nil }
            
            let removeValue = heap[1]
            heap.swapAt(1, heap.count - 1)
            heap.removeLast()
            
            func moveDown(_ index: Int) -> MoveDownStatus {
                let leftChildIndex = index * 2
                let rightChildIndex = leftChildIndex + 1
                
                if leftChildIndex > heap.count - 1 { return .none }
                
                if rightChildIndex > heap.count - 1 {
                    return compare(heap[leftChildIndex], heap[index]) ? .left : .none
                }
                
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
        let VE = readLine()!.split(separator: " ").map { Int(String($0))! }
        let (V, E) = (VE[0], VE[1])
        let K = Int(readLine()!)!
        var graph: [Int: [Edge]] = [:]
        
        (1...V).forEach { graph[$0] = [] }
        
        for _ in 0..<E {
            let edge = readLine()!.split(separator: " ").map { Int(String($0))! }
            graph[edge[0]]!.append(Edge(node: edge[1], weight: edge[2]))
        }
        
        func dijkstra(_ startNode: Int) -> [Int] {
            var heap = Heap<Edge>(type: .min)
            heap.insert(Edge(node: startNode, weight: 0))
            var visited = Array(repeating: false, count: V + 1)
            var dist = Array(repeating: -1, count: V + 1)
            
            while !heap.isEmpty {
                let edge = heap.remove()!
                
                if visited[edge.node] { continue }
                visited[edge.node] = true
                
                dist[edge.node] = edge.weight
                
                for nextEdge in graph[edge.node]! {
                    let newWeight = edge.weight + nextEdge.weight
                    heap.insert(Edge(node: nextEdge.node, weight: newWeight))
                }
            }
            
            return dist
        }
        
        let dist = dijkstra(K)
        for i in 1...V {
            print(dist[i] == -1 ? "INF" : dist[i])
        }
    }
}
