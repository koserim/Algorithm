var visit = [Bool](repeating: false, count: 1000)

func splitString(_ str: String) -> [String] {
    var splitted: [String] = []
    var index = str.startIndex
    for _ in 0..<str.count-1 {
        var temp = ""
        if(str[index] < "A" || (str[index] > "Z" && str[index] < "a") || str[index] > "z") { 
            index = str.index(after: index)
            continue 
        }
        if(str[index] >= "a" || str[index] <= "z") {
            temp += str[index].uppercased()
        } else {
            temp += String(str[index])
        }
        index = str.index(after: index)
        if(str[index] < "A" || (str[index] > "Z" && str[index] < "a") || str[index] > "z") { continue }
        if(str[index] >= "a" || str[index] <= "z") {
            temp += str[index].uppercased()
        } else {
            temp += String(str[index])
        }
        splitted.append(temp)
    }
    return splitted
}

func compare(_ arr1: [String], _ arr2: [String]) -> Double {
    var arr1 = arr1
    var arr2 = arr2
    var count: Double = 0
    if(arr1.count > arr2.count) { swap(&arr1, &arr2) }
    arr1.forEach {
        var index: Int = 0
        while(index != arr2.count) {
            if(visit[index] || $0 != arr2[index]) {
                index += 1
                continue
            }
            visit[index] = true
            count += 1
            break
        }
    }
    return count
}

func solution(_ str1:String, _ str2:String) -> Int {
    let splitted1 = splitString(str1).sorted()
    let splitted2 = splitString(str2).sorted()
    let duplicatedSize = compare(splitted1, splitted2)
    let unionedSize = Double(splitted1.count) + Double(splitted2.count) - duplicatedSize
    if(unionedSize == 0) { return 65536 }
    return Int(duplicatedSize / unionedSize * 65536)
}
