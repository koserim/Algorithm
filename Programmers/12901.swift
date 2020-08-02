func countDateFrom(month: Int, day: Int) -> Int {
    let daysInMonth = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    var count = 0
    for i in 0..<month-1 {
        count += daysInMonth[i]
    }
    return count + day
}

func solution(_ a:Int, _ b:Int) -> String {
    let days = ["SUN","MON","TUE","WED","THU","FRI","SAT"]
    let dayIndex = (countDateFrom(month: a, day: b) + 4) % 7
    return days[dayIndex]
}
