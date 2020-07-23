import Foundation

func solution(_ strings:[String], _ n:Int) -> [String] {
    return strings.sorted(by: {
        let s1: String = $0
        let index1 = s1.index(s1.startIndex, offsetBy: n)
        let s2: String = $1
        let index2 = s2.index(s2.startIndex, offsetBy: n)
        if(s1[index1] == s2[index2]) {
            return s1 < s2
        }
        return s1[index1] < s2[index2]
    })
}
