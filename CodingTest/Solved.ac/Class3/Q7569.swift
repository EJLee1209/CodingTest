//
//  Q7569.swift
//  CodingTest
//
//  Created by 이은재 on 12/23/23.
//https://www.acmicpc.net/problem/7569

import Foundation

struct Q7569: Template {
    struct Queue {
        typealias ValueType = (z: Int, x: Int, y: Int)
        private var inBox: [ValueType] = []
        private var outBox: [ValueType] = []
        
        var isEmpty: Bool { return inBox.isEmpty && outBox.isEmpty }
        var size: Int { return inBox.count + outBox.count }
        
        mutating func enqueue(_ value: ValueType) { inBox.append(value) }
        
        mutating func dequeue() -> ValueType? {
            if outBox.isEmpty {
                outBox.append(contentsOf: inBox.reversed())
                inBox.removeAll()
            }
            
            return outBox.isEmpty ? nil : outBox.removeLast()
        }
        
    }
    struct TomatoPosition: Hashable {
        let x: Int
        let y: Int
        let z: Int
    }
    
    static func solution() {
        let mnh = readLine()!.split(separator: " ").map { Int(String($0))! }
        let (m, n, h) = (mnh[0], mnh[1], mnh[2])
        var boxes: [[[Int]]] = []
        let dx = [0, 0, -1, 1, 0, 0]
        let dy = [0, 0, 0, 0, -1, 1]
        let dz = [-1, 1, 0, 0, 0, 0]
        var queue = Queue()
        var targets: Set<TomatoPosition> = []
        
        for i in 0..<h {
            var box: [[Int]] = []
            for j in 0..<n {
                box.append(readLine()!.split(separator: " ").map { Int(String($0))! })
                for k in 0..<m {
                    if box[j][k] == 1 {
                        queue.enqueue((i,j,k))
                    } else if box[j][k] == 0 {
                        targets.insert(.init(x: j, y: k, z: i))
                    }
                }
            }
            boxes.append(box)
        }
        
        var day = -1
        while !queue.isEmpty {
            for _ in 0..<queue.size {
                let curPos = queue.dequeue()!
                targets.remove(.init(x: curPos.x, y: curPos.y, z: curPos.z))
                
                for i in 0..<6 {
                    let nx = curPos.x + dx[i]
                    let ny = curPos.y + dy[i]
                    let nz = curPos.z + dz[i]
                    
                    if nx >= 0 && nx < n && ny >= 0 && ny < m && nz >= 0 && nz < h && boxes[nz][nx][ny] == 0 {
                        boxes[nz][nx][ny] = 1
                        queue.enqueue((nz, nx, ny))
                    }
                }
            }
            day += 1
        }
        
        if targets.isEmpty {
            print(day)
        } else {
            print(-1)
        }
        
    }
}
