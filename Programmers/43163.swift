import Foundation

var visit: [Bool] = []

func compareWords(first: String, second: String) -> Bool {
    var flag = 0
    var firstIndex = first.startIndex
    var secondIndex = second.startIndex
    for _ in 0..<first.count {
        if(first[firstIndex] != second[secondIndex]) {
            flag += 1
        }
        if(flag > 1) { return false }
        firstIndex = first.index(after: firstIndex)
        secondIndex = second.index(after: secondIndex)
    }
    return true
}

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    visit = [Bool](repeating: false, count: words.count)
    var queue: [(String, Int)] = [(begin, 0)]
    while (!queue.isEmpty) {
        let current = queue.removeFirst()
        if(current.0 == target) { return current.1 }
        for i in 0..<words.count {
            if(visit[i] || words[i] == current.0) { continue }
            if(!compareWords(first: current.0, second: words[i])) { continue }
            visit[i] = true
            queue.append((words[i], current.1 + 1))
        }
    }
    return 0
}

