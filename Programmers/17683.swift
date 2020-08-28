import Foundation

struct MusicInfo {
    let duration: Int
    let name: String
    let melody: [String]
    
    init(_ duration: Int, _ name: String, _ melody: [String]) {
        self.duration = duration
        self.name = name
        self.melody = melody
    }
}

func convertToInt(in time: String) -> Int {
    let splitted = time.split(separator: ":")
    return Int(String(splitted[0]))! * 60 + Int(String(splitted[1]))!
}

func makeMelody(_ duration: Int, _ melody: String) -> [String] {
    var temp: [String] = []
    var index = melody.startIndex
    for _ in melody {
        if(melody[index] == "#") {
            temp.append(temp.removeLast() + "#")
        } else {
            temp.append(String(melody[index]))
        }
        index = melody.index(after: index)
    }
    var madeMelody: [String] = []
    while(madeMelody.count < duration) {
        temp.forEach { madeMelody.append($0) }
        if(madeMelody.count > duration) {
            let diff = madeMelody.count - duration
            for _ in 0..<diff { madeMelody.popLast() }
        }
    }
    return madeMelody
}

func checkMelody(_ melody: String, in musics: [MusicInfo]) -> [(String, Int)]{
    var myMelody: [String] = []
    var index = melody.startIndex
    var checkedMusic: [(String, Int)] = []
    for _ in melody {
        if(melody[index] == "#") {
            myMelody.append(myMelody.removeLast() + "#")
        } else {
            myMelody.append(String(melody[index]))
        }
        index = melody.index(after: index)
    }
    for i in 0..<musics.count {
        var ii = 0
        let music = musics[i]
        if(myMelody.count > music.duration) { continue }
        for j in 0...music.melody.count {
            if(ii == myMelody.count) {
                checkedMusic.append((music.name, music.duration))
                break
            }
            if(j == music.melody.count) { break }
            if(myMelody[ii] != music.melody[j]) {
                ii = 0
                if(myMelody[ii] == music.melody[j]) { ii += 1 }
                continue
            }
            ii += 1
        }
    }
    return checkedMusic
}

func solution(_ m:String, _ musicinfos:[String]) -> String {
    var answer = "(None)"
    var splitted: [[String.SubSequence]] = []
    var musics: [MusicInfo] = []
    musicinfos.map {
        splitted.append($0.split(separator: ","))
    }
    splitted.forEach {
        let duration = convertToInt(in: String($0[1])) - convertToInt(in: String($0[0]))
        let name = String($0[2])
        let melody = makeMelody(duration, String($0[3]))
        let music = MusicInfo(duration, name, melody)
        musics.append(music)
    }
    let checkedMusic = checkMelody(m, in: musics)
    if(checkedMusic.count == 0) { return answer }
    var max = 0
    checkedMusic.forEach {
        if($0.1 > max) {
            max = $0.1
            answer = $0.0
        }
    }
    return answer
}

