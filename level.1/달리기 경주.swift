// 얀에서는 매년 달리기 경주가 열립니다. 해설진들은 선수들이 자기 바로 앞의 선수를 추월할 때 추월한 선수의 이름을 부릅니다.
// 예를 들어 1등부터 3등까지 "mumu", "soe", "poe" 선수들이 순서대로 달리고 있을 때,
// 해설진이 "soe"선수를 불렀다면 2등인 "soe" 선수가 1등인 "mumu" 선수를 추월했다는 것입니다.
// 즉 "soe" 선수가 1등, "mumu" 선수가 2등으로 바뀝니다.

// 선수들의 이름이 1등부터 현재 등수 순서대로 담긴 문자열 배열 players와 해설진이 부른 이름을 담은 문자열 배열 callings가 매개변수로 주어질 때,
// 경주가 끝났을 때 선수들의 이름을 1등부터 등수 순서대로 배열에 담아 return 하는 solution 함수를 완성해주세요.

// - 제한사항
// 5 ≤ players의 길이 ≤ 50,000
// players[i]는 i번째 선수의 이름을 의미합니다.
// players의 원소들은 알파벳 소문자로만 이루어져 있습니다.
// players에는 중복된 값이 들어가 있지 않습니다.
// 3 ≤ players[i]의 길이 ≤ 10
// 2 ≤ callings의 길이 ≤ 1,000,000
// callings는 players의 원소들로만 이루어져 있습니다.
// 경주 진행중 1등인 선수의 이름은 불리지 않습니다.

// https://school.programmers.co.kr/learn/courses/30/lessons/178871

import Foundation

func solution_(_ players:[String], _ callings:[String]) -> [String] {
    var players = players
    for call in callings {
        let idx = players.firstIndex(of: call)!
        let beforeIdx = players.index(before: idx)
        players.swapAt(beforeIdx, idx)
    }
    return players
}

// 시간 초과...!

import Foundation

func solution(_ players:[String], _ callings:[String]) -> [String] {
    var players = players // 현재 순위를 순서대로 기록
    var dict: [String: Int] = [:] // 각 선수의 현재 순위
    for idx in (0..<players.count) {
        dict[players[idx]] = idx
    }
    
    for upgoingPlayer in callings {
        let originalRank = dict[upgoingPlayer]! // 올라가는 선수의 이전 순위
        let downFallingPlayer = players[originalRank - 1] // 떨어진 선수
        dict[upgoingPlayer] = originalRank - 1 // 올라가는 선수의 순위 업데이트
        dict[downFallingPlayer] = originalRank // 떨어진 선수의 순위 업데이트
        players[originalRank] = downFallingPlayer
        players[originalRank - 1] = upgoingPlayer
    }
    return players
}

let _ = solution(["mumu", "soe", "poe", "kai", "mine"], ["kai", "kai", "mine", "mine"])

// Hash Table의 이점을 살리기 위해 Dictionary와 배열의 인덱스 직접 접근을 활용!