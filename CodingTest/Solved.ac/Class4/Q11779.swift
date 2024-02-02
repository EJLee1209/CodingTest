//
//  Q11779.swift
//  CodingTest
//
//  Created by 이은재 on 2/2/24.
//

struct Q11779: Template {
    struct Edge: Comparable {
        let node: Int
        let cost: Int
        let history: [Int]
        
        static func < (lhs: Edge, rhs: Edge) -> Bool {
            return lhs.cost < rhs.cost
        }
    }
    
    struct Heap<T: Comparable> {
        private var heap: [T] = []
        private let compare: (T, T) -> Bool
        
        var isEmpty: Bool { heap.count <= 1 }
        
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
            
            func moveDown(index: Int) -> MoveDownStatus {
                let leftChildIndex = index * 2
                let rightChildIndex = leftChildIndex + 1
                
                if leftChildIndex >= heap.count {
                    return .none
                }
                
                if rightChildIndex >= heap.count {
                    return compare(heap[leftChildIndex], heap[index]) ? .left(index: leftChildIndex) : .none
                }
                
                if compare(heap[index], heap[leftChildIndex]) && compare(heap[index], heap[rightChildIndex]) {
                    return .none
                }
                
                return compare(heap[leftChildIndex], heap[rightChildIndex]) ? .left(index: leftChildIndex) : .right(index: rightChildIndex)
            }
            
            var popIndex = 1
            while true {
                switch moveDown(index: popIndex) {
                case .none:
                    return popValue
                case let .left(index), let .right(index):
                    heap.swapAt(popIndex, index)
                    popIndex = index
                }
            }
        }
    }
    
    static func solution() {
        let n = Int(readLine()!)!
        let m = Int(readLine()!)!
        var graph: [Int: [Edge]] = [:]
        (1...n).forEach { graph[$0] = [] }
        
        for _ in 0..<m {
            let input = readLine()!.split(separator: " ").map { Int(String($0))! }
            graph[input[0]]!.append(Edge(node: input[1], cost: input[2], history: []))
        }
        
        let targets = readLine()!.split(separator: " ").map { Int(String($0))! }
        let (startNode, endNode) = (targets[0], targets[1])
        
        let (minCost, history) = dijkstra()
        print(minCost)
        print(history.count)
        print(history.map { String($0) }.joined(separator: " "))
        
        func dijkstra() -> (cost: Int, history: [Int]) {
            var heap = Heap<Edge>(compare: <)
            heap.insert(Edge(node: startNode, cost: 0, history: [startNode]))
            var visited = Array(repeating: false, count: n + 1)
            var dist = Array(repeating: 0, count: n + 1)
            var history: [Int] = []
            
            while !heap.isEmpty {
                let edge = heap.pop()!
                
                if visited[edge.node] { continue }
                visited[edge.node] = true
                dist[edge.node] = edge.cost
                if edge.node == endNode {
                    history = edge.history
                    break
                }
                
                for nextEdge in graph[edge.node]! {
                    let newCost = edge.cost + nextEdge.cost
                    let newHistory = edge.history + [nextEdge.node]
                    heap.insert(Edge(node: nextEdge.node, cost: newCost, history: newHistory))
                }
            }
            
            return (dist[endNode], history)
        }
    }
}
