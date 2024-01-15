//
//  Q1916.swift
//  CodingTest
//
//  Created by 이은재 on 1/15/24.
//https://www.acmicpc.net/problem/1916

struct Q1916: Template {
    struct Edge: Comparable {
        var node: Int
        var cost: Int
        
        static func < (lhs: Edge, rhs: Edge) -> Bool {
            return lhs.cost < rhs.cost
        }
    }
    
    struct Heap<T: Comparable> {
        
        private var heap: [T] = []
        private let compare: (T, T) -> Bool
        
        var isEmpty: Bool { return heap.count <= 1 }
        
        init(compare: @escaping (T, T) -> Bool) {
            self.compare = compare
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
                
                if leftChildIndex > heap.count - 1 {
                    return .none
                }
                
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
        let N = Int(readLine()!)!
        let M = Int(readLine()!)!
        var graph: [Int: [Edge]] = [:]
        
        (1...N).forEach { graph[$0] = [] }
        
        for _ in 0..<M {
            let input = readLine()!.split(separator: " ").map { Int(String($0))! }
            graph[input[0]]!.append(Edge(node: input[1], cost: input[2]))
        }
        
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        let startNode = input[0]
        let endNode = input[1]
        
        print(dijkstra()[endNode])
        
        func dijkstra() -> [Int] {
            var heap = Heap<Edge>(compare: <)
            heap.insert(Edge(node: startNode, cost: 0))
            var visited = Array(repeating: false, count: N + 1)
            var costs = Array(repeating: 0, count: N + 1)
            
            while !heap.isEmpty {
                let edge = heap.remove()!
                
                if visited[edge.node] { continue }
                visited[edge.node] = true
                
                costs[edge.node] = edge.cost
                
                for nextEdge in graph[edge.node]! {
                    let newCost = edge.cost + nextEdge.cost
                    heap.insert(Edge(node: nextEdge.node, cost: newCost))
                }
            }
            
            return costs
        }
    }
}
