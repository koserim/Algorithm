import Foundation

func solution(_ record:[String]) -> [String] {
    var answer: [String] = []
    let splitted = record.map { $0.split(separator: " ") }
    var users: Dictionary<String, String> = [:]
    splitted.forEach {
        switch $0[0] {
        case "Enter", "Change":
            users.updateValue(String($0[2]), forKey: String($0[1]))
        default: break
        }
    }
    splitted.forEach {
        let uid = String($0[1])
        switch $0[0] {
        case "Enter":
            answer.append("\(users[uid] ?? "")님이 들어왔습니다.")
        case "Leave":
            answer.append("\(users[uid] ?? "")님이 나갔습니다.")
        default: break
        }
    }
    return answer
}
