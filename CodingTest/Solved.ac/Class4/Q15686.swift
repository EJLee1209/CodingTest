//
//  Q15686.swift
//  CodingTest
//
//  Created by 이은재 on 2/4/24.
//https://www.acmicpc.net/problem/15686

struct Q15686: Template {
    
    static func solution() {
        let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
        let (n, m) = (nm[0], nm[1])
        var chickens: [[Int]] = []
        var homes: [[Int]] = []
        var answer = Int.max
        
        for i in 0..<n {
            let row = readLine()!.split(separator: " ").map { Int(String($0))! }
            for j in 0..<n {
                if row[j] == 1 { // 집
                    homes.append([i, j])
                } else if row[j] == 2 { // 치킨
                    chickens.append([i, j])
                }
            }
        }
        
        selectChickens(i: 0, selected: [])
        print(answer)
        
        func getChickenDistance(chickens: [[Int]]) -> Int {
            let homeCnt = homes.count
            var dist = Array(repeating: 200, count: homeCnt)
            
            for chicken in chickens {
                for (idx, home) in homes.enumerated() {
                    let distance = abs(chicken[0] - home[0]) + abs(chicken[1] - home[1])
                    dist[idx] = min(dist[idx], distance)
                }
            }
            
            return dist.reduce(0, +)
        }
        
        func selectChickens(i: Int, selected: [[Int]]) {
            if selected.count == m {
                answer = min(answer, getChickenDistance(chickens: selected))
                return
            }
            if i >= chickens.count {
                return
            }
            
            selectChickens(i: i + 1, selected: selected + [chickens[i]])
            selectChickens(i: i + 1, selected: selected)
        }
        
    }
}
