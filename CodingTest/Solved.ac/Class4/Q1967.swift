//
//  Q1967.swift
//  CodingTest
//
//  Created by 이은재 on 1/18/24.
//https://www.acmicpc.net/problem/1967

struct Q1967: Template {
    struct Edge: Comparable {
        let node: Int
        let weight: Int
        
        static func < (lhs: Edge, rhs: Edge) -> Bool {
            return lhs.weight < rhs.weight
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
        
        enum MoveDownStatus { case none, left, right }
        
        mutating func remove() -> T? {
            if self.isEmpty { return nil }
            
            let removeValue = heap[1]
            heap.swapAt(1, heap.count - 1)
            heap.removeLast()
            
            var removeIndex = 1
            while true {
                switch moveDown(index: removeIndex) {
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
            
            func moveDown(index: Int) -> MoveDownStatus {
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
        }
    }
    static func solution() {
        print(execute())
        
        func execute() -> Int {
            let n = Int(readLine()!)!
            guard n > 1 else {
                return 0
            }
            let graph = makeGraph(n: n)
            return solve(graph: graph, n: n)
        }
        
        func makeGraph(n: Int) -> [Int: [Edge]] {
            var graph: [Int: [Edge]] = [:]
            (1...n).forEach { graph[$0] = [] }
            
            for _ in 1..<n {
                let input = readLine()!.split(separator: " ").map { Int(String($0))! }
                graph[input[0]]!.append(Edge(node: input[1], weight: input[2]))
                graph[input[1]]!.append(Edge(node: input[0], weight: input[2]))
            }
            
            return graph
        }
        
        func solve(graph: [Int: [Edge]], n: Int) -> Int {
            var startNode = 1
            var depthes = dijkstra(graph: graph, startNode: startNode, n: n)
            var maxDepth = -1
            
            for (idx, value) in depthes.enumerated() {
                if value > maxDepth {
                    maxDepth = value
                    startNode = idx
                }
            }
            
            depthes = dijkstra(graph: graph, startNode: startNode, n: n)
            return depthes.max()!
        }
        
        func dijkstra(graph: [Int: [Edge]], startNode: Int, n: Int) -> [Int] {
            var heap = Heap<Edge>(compare: <)
            heap.insert(Edge(node: startNode, weight: 0))
            var visited = Array(repeating: false, count: n + 1)
            var dist = Array(repeating: 0, count: n + 1)
            
            while !heap.isEmpty {
                let edge = heap.remove()!
                
                if visited[edge.node] { continue }
                visited[edge.node] = true
                dist[edge.node] = edge.weight
                
                for nextEdge in graph[edge.node]! {
                    let weight = edge.weight + nextEdge.weight
                    heap.insert(Edge(node: nextEdge.node, weight: weight))
                }
            }
            
            return dist
        }
    }
}
