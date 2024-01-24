//
//  Q5639.swift
//  CodingTest
//
//  Created by 이은재 on 1/23/24.
//https://acmicpc.net/problem/5639

struct Q5639: Template {
    
    static func solution() {
        /// 입력으로 주어진 전위 순회 결과로 트리를 만들지 않고, 해당 정보를 이용해서 후위 순회 수행

        var nodes = [Int]()
        while let input = readLine(), let node = Int(input) {
            nodes.append(node)
        }
        
        traversal(tree: nodes)

        func traversal(tree: [Int]) {
            if tree.isEmpty { return }
            let root = tree[0]
            
            let rightStartIdx = findRightRootIndex(
                startIndex: 0,
                endIndex: tree.count - 1,
                rootNode: root
            )
            
            if let rightStartIdx = rightStartIdx {
                traversal(tree: Array(tree[1..<rightStartIdx]))
                traversal(tree: Array(tree[rightStartIdx...]))
            } else {
                traversal(tree: Array(tree[1...]))
            }
            
            print(root)
            
            func findRightRootIndex(
                startIndex: Int,
                endIndex: Int,
                rootNode: Int
            ) -> Int? {
                var lt = startIndex, rt = endIndex
                
                while lt < rt {
                    let mid = (lt + rt) / 2
                    if tree[mid] > rootNode {
                        rt = mid
                    } else {
                        lt = mid + 1
                    }
                }
                
                return tree[lt] > rootNode ? lt : nil
            }
        }

        /// 입력으로 주어지는 전위 순회 결과로 트리를 만들어서 후위 순회를 하도록 구현 (시간 초과)
        /// 편향 이진 트리가 입력으로 주어지는 경우 트리를 만드는 과정에서 시간 초과가 나는 걸로 예상 됨

//        var tree = [Int: (left: Int?, right: Int?)]()
//        var rootNode: Int!
//        while let input = readLine(), let node = Int(input) {
//            insertNode(node)
//        }
//        var count = 0
//        treeTraversal(rootNode: rootNode)
//        
//        func insertNode(_ node: Int) {
//            if tree.isEmpty {
//                tree[node] = (nil, nil)
//                rootNode = node
//                return
//            }
//            
//            var curNode = rootNode!
//            while true {
//                if node > curNode { // 오른쪽
//                    if let right = tree[curNode]?.right {
//                        curNode = right
//                    } else {
//                        tree[curNode]?.right = node
//                        tree[node] = (nil, nil)
//                        break
//                    }
//                } else { // 왼쪽
//                    if let left = tree[curNode]?.left {
//                        curNode = left
//                    } else {
//                        tree[curNode]?.left = node
//                        tree[node] = (nil, nil)
//                        break
//                    }
//                }
//            }
//        }
//        
//        func treeTraversal(rootNode: Int) {
//            count += 1
//            if let left = tree[rootNode]?.left {
//                treeTraversal(rootNode: left)
//            }
//            if let right = tree[rootNode]?.right {
//                treeTraversal(rootNode: right)
//            }
//            print(rootNode)
//        }
    }
}
