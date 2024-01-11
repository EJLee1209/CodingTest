//
//  Q1043.swift
//  CodingTest
//
//  Created by 이은재 on 1/6/24.
//https://www.acmicpc.net/problem/1043

import Foundation

struct Q1043: Template {
    static func solution() {
        let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
        let (n, m) = (nm[0], nm[1])
        var parent = (0...n).map { $0 }
        let whoKnowTruth = Array(readLine()!.split(separator: " ").map{ Int(String($0))! }.dropFirst())
        var party: [[Int]] = []
        
        for _ in 0..<m {
            let participant = Array(readLine()!.split(separator: " ").map { Int(String($0))! }.dropFirst())
            
            for i in 0..<participant.count - 1 {
                union(participant[i], participant[i + 1])
            }
            
            party.append(participant)
        }
        
        var result = 0
        if whoKnowTruth.isEmpty {
            result = m
        } else {
            for i in 0..<whoKnowTruth.count - 1 {
                union(whoKnowTruth[i], whoKnowTruth[i + 1])
            }
            
            let whoKnowTruthParent = findParent(whoKnowTruth.first!)
            
            for participant in party {
                if findParent(participant.first!) != whoKnowTruthParent {
                    result += 1
                }
            }
        }
        print(result)
        
        func findParent(_ x: Int) -> Int {
            if parent[x] == x { return x }
            parent[x] = findParent(parent[x])
            return parent[x]
        }
        
        func union(_ a: Int, _ b: Int) {
            let pa = findParent(a), pb = findParent(b)
            
            guard pa != pb else { return }
            
            if pa > pb { parent[pa] = pb }
            else { parent[pb] = pa }
        }
    }
    
}
