func solution(_ seoul:[String]) -> String {
    var index = 0
    for name in seoul {
        if(String(name) == "Kim") {
            return "김서방은 \(index)에 있다"
        }
        index += 1
    }
    return "not found"
}
