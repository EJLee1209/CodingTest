//
//  Q1005.swift
//  CodingTest
//
//  Created by 이은재 on 2/29/24.
//https://www.acmicpc.net/problem/1010

import Foundation

struct Q1005: Template {
    
    final class FileIO {
        private var buffer:[UInt8]
        private var index: Int

        init(fileHandle: FileHandle = FileHandle.standardInput) {
            buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
            index = 0
        }

        @inline(__always) private func read() -> UInt8 {
            defer { index += 1 }

            return buffer.withUnsafeBufferPointer { $0[index] }
        }

        @inline(__always) func readInt() -> Int {
            var sum = 0
            var now = read()
            var isPositive = true

            while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
            if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
            while now >= 48, now <= 57 {
                sum = sum * 10 + Int(now-48)
                now = read()
            }

            return sum * (isPositive ? 1:-1)
        }

        @inline(__always) func readString() -> String {
            var str = ""
            var now = read()

            while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시

            while now != 10
                && now != 32 && now != 0 {
                    str += String(bytes: [now], encoding: .ascii)!
                    now = read()
            }

            return str
        }
    }
    
    static func solution() {
        let fIO = FileIO()
        
        for _ in 0..<fIO.readInt() {
            let (n, k) = (fIO.readInt(), fIO.readInt())
            
            var time = [0]
            for _ in 0..<n {
                time.append(fIO.readInt())
            }
            
            var graph = Array(repeating: [Int](), count: 1001)
            var prevCount = Array(repeating: 0, count: n + 1)
            
            for _ in 0..<k {
                let (s, e) = (fIO.readInt(), fIO.readInt())
                graph[s].append(e)
                prevCount[e] += 1
            }
            let w = fIO.readInt()
            
            var queue = [Int]()
            var front = 0
            
            // 선행자가 없는 노드를 큐에 저장
            for i in 1...n where prevCount[i] == 0 {
                queue.append(i)
            }
            
            var result = Array(repeating: 0, count: n + 1)
            while prevCount[w] != 0 {
                let node = queue[front]
                front += 1
                
                for next in graph[node] {
                    prevCount[next] -= 1
                    result[next] = max(result[next], result[node] + time[node])
                    
                    if prevCount[next] == 0 {
                        queue.append(next)
                    }
                }
            }
            
            print(result[w] + time[w])
        }
    }
}
