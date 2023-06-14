// https://school.programmers.co.kr/learn/courses/30/lessons/120813
// 범위 Array 초기화
// Array(1...100): 1 이상 100 이하의 수로 이루어진 배열

import Foundation

func solution(_ n:Int) -> [Int] {
    let nums: [Int] = Array(1...n)
    return nums.filter { $0 % 2 != 0 }
}