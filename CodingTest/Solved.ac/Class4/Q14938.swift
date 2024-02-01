//
//  Q14938.swift
//  CodingTest
//
//  Created by 이은재 on 2/1/24.
//https://www.acmicpc.net/problem/14938

struct Q14938: Template {
    struct Edge: Comparable {
        let node: Int
        let distance: Int
        
        static func < (lhs: Edge, rhs: Edge) -> Bool {
            return lhs.distance < rhs.distance
        }
    }
    
    struct MinHeap<T: Comparable> {
        private var heap: [T] = []
        
        var isEmpty: Bool { heap.count <= 1 }
        
        mutating func insert(_ value: T) {
            if heap.isEmpty {
                heap.append(value)
                heap.append(value)
                return
            }
            
            heap.append(value)
            var insertIndex = heap.count - 1
            while insertIndex > 1 && heap[insertIndex] < heap[insertIndex / 2] {
                let parentIndex = insertIndex / 2
                heap.swapAt(insertIndex, parentIndex)
                insertIndex = parentIndex
            }
        }
        
        enum MoveDownStatus {
            case none
            case left(Int)
            case right(Int)
        }
        
        mutating func pop() -> T? {
            if isEmpty { return nil }
            
            let popValue = heap[1]
            heap.swapAt(1, heap.count - 1)
            heap.removeLast()
            
            func moveDown(index: Int) -> MoveDownStatus {
                let leftChildIndex = index * 2
                let rightChildIndex = leftChildIndex + 1
                
                if leftChildIndex >= heap.count {
                    return .none
                }
                
                if rightChildIndex >= heap.count {
                    return heap[index] > heap[leftChildIndex] ? .left(leftChildIndex) : .none
                }
                
                if heap[leftChildIndex] > heap[index] && heap[rightChildIndex] > heap[index] {
                    return .none
                }
                
                return heap[leftChildIndex] > heap[rightChildIndex] ? .right(rightChildIndex) : .left(leftChildIndex)
            }
            
            var popIndex = 1
            while true {
                switch moveDown(index: popIndex) {
                case .none:
                    return popValue
                case .left(let childIndex), .right(let childIndex):
                    heap.swapAt(popIndex, childIndex)
                    popIndex = childIndex
                }
            }
        }
    }
    
    static func solution() {
        let nmr = readLine()!.split(separator: " ").map { Int(String($0))! }
        let (n, m, r) = (nmr[0], nmr[1], nmr[2])
        let items = [0] + readLine()!.split(separator: " ").map { Int(String($0))! }
        var graph: [Int: [Edge]] = [:]
        (1...n).forEach { graph[$0] = [] }
        
        for _ in 0..<r {
            let input = readLine()!.split(separator: " ").map { Int(String($0))! }
            graph[input[0]]!.append(Edge(node: input[1], distance: input[2]))
            graph[input[1]]!.append(Edge(node: input[0], distance: input[2]))
        }
        
        var answer = 0
        for i in 1...n {
            answer = max(dijkstra(node: i), answer)
        }
        print(answer)
        
        func dijkstra(node: Int) -> Int {
            var itemsCount = 0
            var visited = Array(repeating: false, count: n + 1)
            var heap = MinHeap<Edge>()
            heap.insert(Edge(node: node, distance: 0))
            
            while !heap.isEmpty {
                let edge = heap.pop()!
                
                if visited[edge.node] { continue }
                visited[edge.node] = true
                
                if edge.distance <= m {
                    itemsCount += items[edge.node]
                }
                
                for nextEdge in graph[edge.node]! {
                    let newDistance = edge.distance + nextEdge.distance
                    heap.insert(Edge(node: nextEdge.node, distance: newDistance))
                }
            }
            
            return itemsCount
        }
        
        
    }
}
