// 휴대폰의 자판은 컴퓨터 키보드 자판과는 다르게 하나의 키에 여러 개의 문자가 할당될 수 있습니다.
// 키 하나에 여러 문자가 할당된 경우, 동일한 키를 연속해서 빠르게 누르면 할당된 순서대로 문자가 바뀝니다.

// 예를 들어, 1번 키에 "A", "B", "C" 순서대로 문자가 할당되어 있다면 1번 키를 한 번 누르면 "A", 두 번 누르면 "B", 세 번 누르면 "C"가 되는 식입니다.

// 같은 규칙을 적용해 아무렇게나 만든 휴대폰 자판이 있습니다.
// 이 휴대폰 자판은 키의 개수가 1개부터 최대 100개까지 있을 수 있으며, 특정 키를 눌렀을 때 입력되는 문자들도 무작위로 배열되어 있습니다.
// 또, 같은 문자가 자판 전체에 여러 번 할당된 경우도 있고, 키 하나에 같은 문자가 여러 번 할당된 경우도 있습니다.
// 심지어 아예 할당되지 않은 경우도 있습니다. 따라서 몇몇 문자열은 작성할 수 없을 수도 있습니다.

// 이 휴대폰 자판을 이용해 특정 문자열을 작성할 때, 키를 최소 몇 번 눌러야 그 문자열을 작성할 수 있는지 알아보고자 합니다.

// 1번 키부터 차례대로 할당된 문자들이 순서대로 담긴 문자열배열 keymap과 입력하려는 문자열들이 담긴 문자열 배열 targets가 주어질 때,
// 각 문자열을 작성하기 위해 키를 최소 몇 번씩 눌러야 하는지 순서대로 배열에 담아 return 하는 solution 함수를 완성해 주세요.

// 단, 목표 문자열을 작성할 수 없을 때는 -1을 저장합니다.

// - 제한사항
// 1 ≤ keymap의 길이 ≤ 100
// 1 ≤ keymap의 원소의 길이 ≤ 100
// keymap[i]는 i + 1번 키를 눌렀을 때 순서대로 바뀌는 문자를 의미합니다.
// 예를 들어 keymap[0] = "ABACD" 인 경우 1번 키를 한 번 누르면 A, 두 번 누르면 B, 세 번 누르면 A 가 됩니다.
// keymap의 원소의 길이는 서로 다를 수 있습니다.
// keymap의 원소는 알파벳 대문자로만 이루어져 있습니다.
// 1 ≤ targets의 길이 ≤ 100
// 1 ≤ targets의 원소의 길이 ≤ 100
// targets의 원소는 알파벳 대문자로만 이루어져 있습니다.

// https://school.programmers.co.kr/learn/courses/30/lessons/160586

import Foundation

func solution(_ keymap:[String], _ targets:[String]) -> [Int] {
    var result: [Int] = []
    for target in targets {
        result.append(find(keymap, target))
    }
    return result
}

func find(_ keymap: [String], _ target: String) -> Int {
    var result: Int = 0
    
    for char in target { // target의 한 글자씩 선택해서
        var cache: Int = -1
        keymap.forEach { key in // keymap들을 돌며
            if let idx = key.firstIndex(of: char) { // key에 글자가 있을 경우
                // 해당 key를 몇 번 눌러야하는지 알아내고
                let firstIndex = key.distance(from: key.startIndex, to: idx) + 1
                // cache가 설정된 적 있다면 둘 중 작은 값, 없다면 바로 기록
                cache = cache == -1 ? firstIndex : min(firstIndex, cache)
            }
        }
        if cache == -1 {
            return -1
        }
        result += cache
    }
    return result
}

// Dictionary 활용

import Foundation

func solution(_ keymap:[String], _ targets:[String]) -> [Int] {
  var map = [Character: Int]() // 각 입력값들의 최소 입력 횟수 Dictionary
  var answer = [Int]()

  for key in keymap { // "ABACD"
    key.enumerated().forEach { idx, char in // "A"
      if map[char, default: Int.max] > idx {
        map[char] = idx + 1 // 작은 값을 map에 저장
      }
    }
  }

  targets.forEach {
    var sum = 0
    for target in $0 {
      guard let key = map[target] else { sum = -1; break }
      sum += key
    }
    answer.append(sum)
  }

  return answer
}