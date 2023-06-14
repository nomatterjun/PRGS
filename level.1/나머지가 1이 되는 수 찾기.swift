// 자연수 n이 매개변수로 주어집니다.
// n을 x로 나눈 나머지가 1이 되도록 하는 가장 작은 자연수 x를 return 하도록 solution 함수를 완성해주세요.
// 답이 항상 존재함은 증명될 수 있습니다.
// - 제한 사항
// 3 ≤ n ≤ 1,000,000
// https://school.programmers.co.kr/learn/courses/30/lessons/87389

import Foundation

func solution(_ n:Int) -> Int {
    return (2...n).first(where: {
        n % $0 == 1
    })!
}

// first(where:) 문의 활용
// ⚠️ 일반적으로 사용하는 first와 같이 Optional 값을 반환하기 떄문에 unwrapping이 필요하다.