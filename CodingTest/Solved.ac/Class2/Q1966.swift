//
//  Q1966.swift
//  CodingTest
//
//  Created by 이은재 on 12/4/23.
//https://www.acmicpc.net/problem/1966

import Foundation

fileprivate struct Queue {
    private var inBox: [(Int, Int)] = []
    private var outBox: [(Int, Int)] = []
    
    var isEmpty: Bool {
        return inBox.isEmpty && outBox.isEmpty
    }
    
    var count: Int {
        return inBox.count + outBox.count
    }
    
    var maxValue: Int {
        let inBoxMaxValue = inBox.max { $0.0 < $1.0 }?.0
        let outBoxMaxValue = outBox.max { $0.0 < $1.0 }?.0
        
        return max(inBoxMaxValue ?? 0 , outBoxMaxValue ?? 0)
    }
    
    mutating func enqueue(_ priority: Int, _ index: Int) {
        inBox.append((priority, index))
    }

    mutating func dequeue() -> (Int, Int)? {
        if outBox.isEmpty {
            outBox.append(contentsOf: inBox.reversed())
            inBox.removeAll()
        }
        
        return outBox.isEmpty ? nil : outBox.removeLast()
    }
}

struct Q1966: Template {
    static func solution() {
        let t = Int(readLine()!)!
        
        for _ in 0..<t {
            let nm = readLine()!.split(separator: " ").map { Int($0)! }
            let (n,m) = (nm[0], nm[1])
            let documents = readLine()!.split(separator: " ").map { Int($0)! }
            var q = Queue()
            
            for (idx, priority) in documents.enumerated() {
                q.enqueue(priority, idx)
            }
            
            var cnt = 1
            while !q.isEmpty {
                let tmp = q.dequeue()!
                if tmp.0 < q.maxValue {
                    q.enqueue(tmp.0, tmp.1)
                } else {
                    if tmp.1 == m {
                        print(cnt)
                        break
                    }
                    cnt += 1
                }
            }
        }
    }
}
