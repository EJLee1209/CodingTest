//
//  Q7662.swift
//  CodingTest
//
//  Created by 이은재 on 12/26/23.
//https://www.acmicpc.net/problem/7662

import Foundation

struct Q7662: Template {
    struct MinHeap<T: Comparable> {
        private var array: [T] = []
        var isEmpty: Bool { return array.count <= 1 }
        
        mutating func insert(_ value: T) {
            if array.isEmpty {
                /// 빈 배열인 경우 1번 인덱스부터 루트 노드로 시작하기 위해서 인위적으로 값을 2개 넣어줌
                array.append(value)
                array.append(value)
                return
            }
            array.append(value)
            
            func moveUp(_ index: Int) -> Bool {
                if index <= 1 { return false }
                
                let parentIndex = index / 2
                return array[parentIndex] > array[index]
            }
            
            var insertIndex = array.count - 1
            while moveUp(insertIndex) {
                let parentIndex = insertIndex / 2
                array.swapAt(insertIndex, parentIndex)
                insertIndex = parentIndex
            }
        }
        
        enum MoveDownStatus {
            case none
            case left(index: Int)
            case right(index: Int)
        }
        
        @discardableResult
        mutating func remove() -> T? {
            if self.isEmpty { return nil }
            
            let removeValue = array[1]
            array.swapAt(1, array.count - 1)
            array.removeLast()
            
            func moveDown(_ parentIndex: Int) -> MoveDownStatus {
                let leftChildIdx = parentIndex * 2
                let rightChildIdx = leftChildIdx + 1
                
                /// 1. 자식 노드가 없는 경우
                if leftChildIdx >= array.count { return .none }
                /// 2. 왼쪽 자식 노드만 있는 경우
                if rightChildIdx >= array.count {
                    return array[parentIndex] > array[leftChildIdx] ? .left(index: leftChildIdx) : .none
                }
                /// 3. 왼쪽, 오른쪽 자식 노드 모두 있는 경우
                /// 3-1. 부모 노드가 자식 노드보다 값이 작은 경우
                if array[leftChildIdx] > array[parentIndex] && array[rightChildIdx] > array[parentIndex] {
                    return .none
                }
                /// 3-2. 자식들이 부모 노드보다 값이 작은 경우
                if array[leftChildIdx] < array[parentIndex] && array[rightChildIdx] < array[parentIndex] {
                    return array[leftChildIdx] > array[rightChildIdx] ? .right(index: rightChildIdx) : .left(index: leftChildIdx)
                }
                /// 3-3. 자식들 중 하나만 부모 노드보다 값이 작은 경우
                if array[parentIndex] > array[leftChildIdx] || array[parentIndex] > array[rightChildIdx] {
                    return array[leftChildIdx] > array[rightChildIdx] ? .right(index: rightChildIdx) : .left(index: leftChildIdx)
                }
                return .none
            }
            
            var removeIndex = 1
            while true {
                switch moveDown(removeIndex) {
                case .none:
                    return removeValue
                case .left(let index), .right(let index):
                    array.swapAt(removeIndex, index)
                    removeIndex = index
                }
            }
        }
    }

    
    static func solution() {
        let t = Int(readLine()!)!
        
        for _ in 0..<t {
            let k = Int(readLine()!)!
            var minHeap = MinHeap<Int>()
            var maxHeap = MinHeap<Int>()
            var countDict: [Int: Int] = [:]
            
            for _ in 0..<k {
                let input = readLine()!.split(separator: " ")
                let op = input[0]
                let n = Int(input[1])!
                
                switch op {
                    /// I : 삽입 연산
                    /// 최소힙과 최대힙에 모두 삽입
                    /// 삽입한 값 n에 대한 counting
                case "I":
                    if let _ = countDict[n] {
                        countDict[n]! += 1
                    } else {
                        countDict[n] = 1
                    }
                    minHeap.insert(n)
                    maxHeap.insert(-n)
                    /// D: 삭제 연산
                case "D":
                    if n == -1 {
                        /// D -1 : 최솟값 삭제
                        /// 1. 최소힙에서 값을 삭제
                        /// 2. 삭제한 값의 count가 없다면, 이미 최댓값 삭제 연산을 통해 삭제된 값이므로 1번 부터 다시 반복
                        /// 3. 삭제한 값의 count가 존재한다면, count를 1 감소, 감소된 count가 0이라면 해당 count를 제거
                        while !minHeap.isEmpty {
                            let c = minHeap.remove()!
                            if let count = countDict[c] {
                                countDict[c]! -= 1
                                if count == 1 {
                                    countDict.removeValue(forKey: c)
                                }
                                break
                            }
                            
                        }
                    } else {
                        /// D 1 : 최댓값 삭제
                        /// 1. 최대힙에서 값을 삭제
                        /// 2. 삭제한 값의 count가 없다면, 이미 최솟값 삭제 연산을 통해 삭제된 값이므로 1번 부터 다시 반복
                        /// 3. 삭제한 값의 count가 존재한다면, count를 1 감소, 감소된 count가 0이라면 해당 count를 제거
                        while !maxHeap.isEmpty {
                            let c = -maxHeap.remove()!
                            if let count = countDict[c] {
                                countDict[c]! -= 1
                                if count == 1 {
                                    countDict.removeValue(forKey: c)
                                }
                                break
                            }
                        }
                    }
                default:
                    break
                }
            }
            
            if countDict.isEmpty {
                print("EMPTY")
            } else {
                let result = countDict.keys.sorted()
                print(result.last!, result.first!)
            }
        }
    }
}
