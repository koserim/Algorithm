var answer = 0
var squareExists = false
var square = [[Bool]](repeating: Array(repeating: false, count: 30), count: 30)
let dy = [1, 1, 0]
let dx = [0, 1, 1]

func eraseBlocks(_ m: Int, _ n: Int, _ board: [[Character]]) -> [[Character]] {
    var board = board
    for i in 0..<n {
        var queue: [Character] = []
        for j in 1...m {
            if(board[m-j][i] == "0") { continue }
            if(square[m-j][i]) { answer += 1 }
            else { queue.append(board[m-j][i]) }
            board[m-j][i] = "0"
        }
        for j in 1...m {
            if(queue.isEmpty) { break }
            board[m-j][i] = queue.removeFirst()
        }
    }
    return board
}

func makeSquare(_ startY: Int, _ startX: Int) {
    square[startY][startX] = true
    for i in 0..<3 {
        square[startY+dy[i]][startX+dx[i]] = true
    }
}

func checkSqaure(_ startY: Int, _ startX: Int, _ board: [[Character]]) {
    let char = board[startY][startX]
    for i in 0..<3 {
        if(board[startY+dy[i]][startX+dx[i]] != char) { return }
    }
    makeSquare(startY, startX)
    squareExists = true
    return
}

func makeBoard(_ m: Int, _ n: Int, _ board: [String]) -> [[Character]] {
    var newBoard = [[Character]](repeating: Array(repeating: " ", count: 30), count: 30)
    for i in 0..<m {
        for j in 0..<n {
            newBoard[i][j] = board[i][j]
        }
    }
    return newBoard
}

func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    var newBoard = makeBoard(m, n, board)
    while true {
        squareExists = false
        square = [[Bool]](repeating: Array(repeating: false, count: 30), count: 30)
        for i in 0..<m-1 {
            for j in 0..<n-1 {
                if(newBoard[i][j] == "0") { continue }
                checkSqaure(i, j, newBoard)
            }
        }
        newBoard = eraseBlocks(m, n, newBoard)
        if(!squareExists) { return answer }
    }
    return answer
}

extension String {
    subscript(i: Int) -> Character {
        var offset = i
        while offset < 0 { offset += count }
        let index = self.index(startIndex, offsetBy: offset)
        return self[index]
    }
}
