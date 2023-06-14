// 두 정수 left와 right가 매개변수로 주어집니다.
// left부터 right까지의 모든 수들 중에서, 약수의 개수가 짝수인 수는 더하고, 약수의 개수가 홀수인 수는 뺀 수를 return 하도록 solution 함수를 완성해주세요.
// - 제한 사항
// 1 ≤ left ≤ right ≤ 1,000
// https://school.programmers.co.kr/learn/courses/30/lessons/77884

import Foundation

func solution(_ left:Int, _ right:Int) -> Int {
    (left...right).reduce(0) { result, num in
        return divisions(num) % 2 == 0 ? result + num : result - num
    }
}

func divisions(_ n: Int) -> Int {
    return (1...n).reduce(0) { result, num in
        return n % num == 0 ? result + 1 : result
    }
}