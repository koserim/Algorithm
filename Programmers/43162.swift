import Foundation

var visit: [Bool] = []

func bfs(_ computers: [[Int]], _ n: Int, start: Int) {
    var queue: [Int] = []
    queue.append(start)
    visit[start] = true
    while(!queue.isEmpty) {
        let current = queue.removeFirst()
        for index in 0..<n {
            if(computers[current][index] == 0 || visit[index]) { continue }
            visit[index] = true
            queue.append(index)
        }
    }
}

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var answer = 0
    visit = [Bool](repeating: false, count: n)
    for index in 0..<n {
        if(!visit[index]) {
            bfs(computers, n, start: index)
            answer += 1
        }
    }
    return answer
}
