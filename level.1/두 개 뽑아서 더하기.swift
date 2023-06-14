// 정수 배열 numbers가 주어집니다.
// numbers에서 서로 다른 인덱스에 있는 두 개의 수를 뽑아 더해서 만들 수 있는 모든 수를
// 배열에 오름차순으로 담아 return 하도록 solution 함수를 완성해주세요.
// - 제한 사항
// numbers의 길이는 2 이상 100 이하입니다.
// numbers의 모든 수는 0 이상 100 이하입니다.
// https://school.programmers.co.kr/learn/courses/30/lessons/68644

import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var result: Set<Int> = []
    for i in 0..<numbers.count - 1 {
        for j in i+1...numbers.count - 1 {
            result.insert(numbers[i] + numbers[j])
        }
    }
    return Array(result).sorted()
}
