 func solution(_ arr:[Int]) -> Double {
    let result = arr.reduce(0) {$0 + $1}
    return Double(result) / Double(arr.count)
 }
