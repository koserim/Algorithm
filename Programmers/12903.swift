import Foundation

func solution(_ s: String) -> String {
    let len: Int = s.count
    let startIndex = s.index(s.startIndex, offsetBy: (len-1)/2)
    let endIndex = s.index(s.startIndex, offsetBy: len/2)
    return String(s[startIndex...endIndex])
}
