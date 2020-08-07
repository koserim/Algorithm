import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var array = priorities
    var order = 0
    var tempArray: [Int] = []
    for i in 0..<priorities.count {
        tempArray.append(i)
    }
    while(!array.isEmpty) {
        let firstValue = array.removeFirst()
        let firstTempValue = tempArray.removeFirst()
        if(!array.filter { $0 > firstValue }.isEmpty) {
            array.append(firstValue)
            tempArray.append(firstTempValue)
        } else {
            order += 1
            if(firstTempValue == location) { break }
        }
    }
    return order
}
