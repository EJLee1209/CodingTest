//
//  Q16236.swift
//  CodingTest
//
//  Created by 이은재 on 2/5/24.
//https://www.acmicpc.net/problem/16236
struct Q16236: Template {
    struct Fish: Hashable {
        var x: Int
        var y: Int
        var size: Int
        var eatCount: Int {
            didSet {
                if eatCount == size {
                    eatCount = 0
                    size += 1
                }
            }
        }
    }
    
    static func solution() {
        let dx = [-1, 1, 0, 0]
        let dy = [0, 0, -1, 1]
        let n = Int(readLine()!)!
        var shark: Fish!
        var fishes: Set<Fish> = []
        var board: [[Int]] = []
        var answer = 0
        
        for i in 0..<n {
            let row = readLine()!.split(separator: " ").map { Int(String($0))! }
            board.append(row)
            
            for j in 0..<n {
                if row[j] == 9 {
                    shark = Fish(x: i, y: j, size: 2, eatCount: 0)
                } else if (1..<9).contains(row[j]) {
                    fishes.insert(Fish(x: i, y: j, size: row[j], eatCount: 0))
                }
            }
        }
        
        while eatFish() {}
        print(answer)
        
        func eatFish() -> Bool {
            let dist = bfs(shark: shark)
            var minDist = Int.max
            var target: Fish? = nil
            
            for fish in fishes where shark.size > fish.size && dist[fish.x][fish.y] != -1 {
                if minDist > dist[fish.x][fish.y] {
                    target = fish
                    minDist = dist[fish.x][fish.y]
                } else if minDist == dist[fish.x][fish.y] {
                    guard let tmp = target else { continue }
                    if tmp.x > fish.x {
                        target = fish
                    } else if fish.x == tmp.x && tmp.y > fish.y {
                        target = fish
                    }
                }
            }
            guard let target = target else {
                return false
            }
            fishes.remove(target)
            
            board[shark.x][shark.y] = 0
            
            shark.x = target.x
            shark.y = target.y
            shark.eatCount += 1
            
            board[shark.x][shark.y] = 9
            
            answer += dist[target.x][target.y]
            
            return true
        }
        
        func bfs(shark: Fish) -> [[Int]] {
            var dist = Array(repeating: Array(repeating: -1, count: n), count: n)
            dist[shark.x][shark.y] = 0
            var queue = [[shark.x, shark.y]]
            var front = 0
            
            while front < queue.count {
                let (curX, curY) = (queue[front][0], queue[front][1])
                front += 1
                
                for i in 0..<4 {
                    let nx = curX + dx[i]
                    let ny = curY + dy[i]
                    
                    if (0..<n).contains(nx) && (0..<n).contains(ny) && dist[nx][ny] == -1 && board[nx][ny] <= shark.size {
                        queue.append([nx, ny])
                        dist[nx][ny] = dist[curX][curY] + 1
                    }
                }
            }
            
            return dist
        }
    }
}
