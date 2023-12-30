//
//  Q2164.swift
//  CodingTest
//
//  Created by 이은재 on 11/26/23.
//

import Foundation


struct Q2164: Template {
    
    /// 스택을 2개 활용해 큐를 구현하는 방법
    /// inbox: enqueue할 때 사용할 스택
    /// outbox: dequeue할 때 사용할 스택
    /// dequeue할 때, outbox가 비어있으면, inbox의 요소들을 뒤집어서 outbox에 모두 삽입하고, inbox를 초기화함
    struct Queue<T> {
        private var inbox: [T] = []
        private var outbox: [T] = []
        
        var isEmpty: Bool {
            return inbox.isEmpty && outbox.isEmpty
        }
        
        var count: Int {
            return outbox.count + inbox.count
        }
        
        mutating func enqueue(_ input: T) {
            inbox.append(input)
        }
        
        @discardableResult
        mutating func dequeue() -> T? {
            if outbox.isEmpty {
                outbox = inbox.reversed()
                inbox.removeAll()
            }
            
            return outbox.popLast()
        }
    }
    
    static func solution() {
        let n = Int(readLine()!)!
        var queue = Queue<Int>()
        (1...n).forEach { queue.enqueue($0) }
        
        while queue.count > 1 {
            queue.dequeue()
            queue.enqueue(queue.dequeue()!)
        }
        
        print(queue.dequeue()!)
    }
}
