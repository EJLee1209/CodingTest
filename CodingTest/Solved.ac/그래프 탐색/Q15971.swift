//
//  15971.swift
//  CodingTest
//
//  Created by 이은재 on 3/20/24.
//https://www.acmicpc.net/problem/Q15971

struct Q15971: Template {
    struct Edge: Comparable {
        let node: Int
        var weight: Int
        
        static func < (lhs: Edge, rhs: Edge) -> Bool {
            return lhs.weight < rhs.weight
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
            while insertIndex > 1 && heap[insertIndex / 2] > heap[insertIndex] {
                let parentIndex = insertIndex / 2
                heap.swapAt(insertIndex, parentIndex)
                insertIndex = parentIndex
            }
        }
        
        enum MoveDownStatus {
            case none
            case left(_ childIndex: Int)
            case right(_ childIndex: Int)
        }
        
        mutating func pop() -> T? {
            guard !isEmpty else { return nil }
            
            let popValue = heap[1]
            heap.swapAt(1, heap.count - 1)
            heap.removeLast()
            
            func moveDown(parentIndex: Int) -> MoveDownStatus {
                let leftChildIndex = parentIndex * 2
                let rightChildIndex = leftChildIndex + 1
                
                if leftChildIndex >= heap.count { return .none }
                
                if rightChildIndex >= heap.count {
                    return heap[parentIndex] > heap[leftChildIndex] ? .left(leftChildIndex) : .none
                }
                
                if heap[parentIndex] < heap[leftChildIndex] && heap[parentIndex] < heap[rightChildIndex] {
                    return .none
                }
                
                return heap[leftChildIndex] > heap[rightChildIndex] ? .right(rightChildIndex) : .left(leftChildIndex)
            }
            
            var popIndex = 1
            while true {
                switch moveDown(parentIndex: popIndex) {
                case .none:
                    return popValue
                case let .left(childIndex), let .right(childIndex):
                    heap.swapAt(popIndex, childIndex)
                    popIndex = childIndex
                }
            }
        }
    }
    
    static func solution() {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        let (n, a, b) = (input[0], input[1], input[2])
        var graph = [Int: [Edge]]()
        (1...n).forEach { graph[$0] = [] }
        var visited = Array(repeating: false, count: n + 1)
        var answer = Int.max
        
        for _ in 1..<n {
            let input = readLine()!.split(separator: " ").map { Int(String($0))! }
            let (s, e, w) = (input[0], input[1], input[2])
            graph[s]!.append(Edge(node: e, weight: w))
            graph[e]!.append(Edge(node: s, weight: w))
        }
        
        let distanceA = dijkstra(startNode: a)
        let distanceB = dijkstra(startNode: b)
        var routes = [Int]()
        findRoute(node: a, route: [a])
        
        
        for i in 0..<routes.count - 1 {
            let a = routes[i]
            let b = routes[i + 1]
            answer = min(answer, distanceA[a] + distanceB[b])
        }
        print(a == b ? 0 : answer)
        
        func findRoute(node: Int, route: [Int]) {
            if node == b {
                routes = route
            }
            visited[node] = true
            for next in graph[node]! where !visited[next.node] {
                findRoute(node: next.node, route: route + [next.node])
            }
        }
        
        func dijkstra(startNode: Int) -> [Int] {
            var distance = Array(repeating: 0, count: n + 1)
            var visited = Array(repeating: false, count: n + 1)
            var heap = MinHeap<Edge>()
            heap.insert(.init(node: startNode, weight: 0))
            
            while !heap.isEmpty {
                let edge = heap.pop()!
                
                if visited[edge.node] { continue }
                visited[edge.node] = true
                distance[edge.node] = edge.weight
                
                for next in graph[edge.node]! {
                    let weight = edge.weight + next.weight
                    heap.insert(.init(node: next.node, weight: weight))
                }
            }
            
            return distance
        }
    }
}
