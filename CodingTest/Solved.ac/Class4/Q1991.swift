//
//  Q1991.swift
//  CodingTest
//
//  Created by 이은재 on 1/20/24.
//https://www.acmicpc.net/problem/1991

import Foundation

struct Q1991: Template {
    static func solution() {
        let n = Int(readLine()!)!
        var tree: [String: (leftChild: String, rightChild: String)] = [:]
        
        for _ in 0..<n {
            let input = readLine()!.split(separator: " ").map { String($0) }
            tree[input[0]] = (input[1], input[2])
        }
        
        var preorder = ""
        var inorder = ""
        var postorder = ""
        dfs("A")
        print([preorder, inorder, postorder].joined(separator: "\n"))
        
        func dfs(_ node: String) {
            
            preorder.append(node)
            let (left, right) = tree[node]!
            if left != "." {
                dfs(left)
            }
            inorder.append(node)
            if right != "." {
                dfs(right)
            }
            postorder.append(node)
        }
    }
}
