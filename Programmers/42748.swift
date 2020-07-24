import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var ans: Array<Int> = []
    for i in commands {
        var temp: Array<Int> = []
        for j in i[0]...i[1] {
            temp.append(array[j-1])
        }
        temp.sort()
        ans.append(temp[i[2]-1])
    }
    return ans
}
