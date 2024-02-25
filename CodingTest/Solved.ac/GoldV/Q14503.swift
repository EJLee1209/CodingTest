//
//  Q14503.swift
//  CodingTest
//
//  Created by 이은재 on 2/25/24.
//https://www.acmicpc.net/problem/14503

struct Q14503: Template {
    enum Direction: Int {
        case north
        case east
        case south
        case west
        
        var rotate: Self {
            let value = rawValue == 0 ? 3 : rawValue - 1
            return Direction(rawValue: value)!
        }
    }
    
    struct Robot {
        var x: Int
        var y: Int
        var direction: Direction
        
        private let dx = [-1, 0, 1, 0]
        private let dy = [0, 1, 0, -1]
        
        mutating func moveBack() {
            x -= dx[direction.rawValue]
            y -= dy[direction.rawValue]
        }
        
        mutating func moveForward() {
            x += dx[direction.rawValue]
            y += dy[direction.rawValue]
        }
        
        mutating func rotate() {
            direction = direction.rotate
        }
    }
    
    static func solution() {
        let dx = [-1, 0, 1, 0]
        let dy = [0, 1, 0, -1]
        let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
        let (n, m) = (nm[0], nm[1])
        
        let rcd = readLine()!.split(separator: " ").map { Int(String($0))! }
        let (r, c, d) = (rcd[0], rcd[1], rcd[2])
        var board: [[Int]] = []
        var answer = 0
        
        for _ in 0..<n {
            let row = readLine()!.split(separator: " ").map { Int(String($0))! }
            board.append(row)
        }
        
        var robot = Robot(x: r, y: c, direction: .init(rawValue: d)!)
        var visited = Array(repeating: Array(repeating: false, count: m), count: n)
        while true {
            let x = robot.x
            let y = robot.y
            // 현재 칸이 아직 청소되지 않은 경우, 현재 칸 청소
            if board[x][y] == 0 && !visited[x][y] {
                answer += 1
                visited[x][y] = true
            }
            
            var flag = false
            for i in 0..<4 {
                let nx = x + dx[i]
                let ny = y + dy[i]
                
                if (0..<n).contains(nx) && (0..<m).contains(ny) && board[nx][ny] == 0 && !visited[nx][ny] {
                    flag = true
                    break
                }
            }
            
            if flag { // 주변 4칸 중 청소되지 않은 빈칸이 있는 경우
                for _ in 0..<4 {
                    robot.rotate()
                    let nx = robot.x + dx[robot.direction.rawValue]
                    let ny = robot.y + dy[robot.direction.rawValue]
                    
                    if (0..<n).contains(nx) && (0..<m).contains(ny) && board[nx][ny] == 0 && !visited[nx][ny] {
                        robot.moveForward()
                        break
                    }
                }
            } else { // 주변 4칸 중 청소되지 않은 빈칸이 없는 경우
                let nx = x - dx[robot.direction.rawValue]
                let ny = y - dy[robot.direction.rawValue]
                
                if (0..<n).contains(nx) && (0..<m).contains(ny) && board[nx][ny] == 0 {
                    robot.moveBack()
                } else {
                    break
                }
            }
        }
        print(answer)
    }
}
