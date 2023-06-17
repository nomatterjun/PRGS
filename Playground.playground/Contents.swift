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

solution(["ABACD", "BCEFD"], ["ABCD","AABB"])
