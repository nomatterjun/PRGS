// 슈퍼 게임 개발자 오렐리는 큰 고민에 빠졌다. 그녀가 만든 프랜즈 오천성이 대성공을 거뒀지만, 요즘 신규 사용자의 수가 급감한 것이다.
// 원인은 신규 사용자와 기존 사용자 사이에 스테이지 차이가 너무 큰 것이 문제였다.

// 이 문제를 어떻게 할까 고민 한 그녀는 동적으로 게임 시간을 늘려서 난이도를 조절하기로 했다.
// 역시 슈퍼 개발자라 대부분의 로직은 쉽게 구현했지만, 실패율을 구하는 부분에서 위기에 빠지고 말았다.
// 오렐리를 위해 실패율을 구하는 코드를 완성하라.

// - 실패율은 다음과 같이 정의한다.
//   - 스테이지에 도달했으나 아직 클리어하지 못한 플레이어의 수 / 스테이지에 도달한 플레이어 수

// 전체 스테이지의 개수 N, 게임을 이용하는 사용자가 현재 멈춰있는 스테이지의 번호가 담긴 배열 stages가 매개변수로 주어질 때,
// 실패율이 높은 스테이지부터 내림차순으로 스테이지의 번호가 담겨있는 배열을 return 하도록 solution 함수를 완성하라.

// - 제한사항
// 스테이지의 개수 N은 1 이상 500 이하의 자연수이다.
// stages의 길이는 1 이상 200,000 이하이다.
// stages에는 1 이상 N + 1 이하의 자연수가 담겨있다.
// 각 자연수는 사용자가 현재 도전 중인 스테이지의 번호를 나타낸다.
// 단, N + 1 은 마지막 스테이지(N 번째 스테이지) 까지 클리어 한 사용자를 나타낸다.
// 만약 실패율이 같은 스테이지가 있다면 작은 번호의 스테이지가 먼저 오도록 하면 된다.
// 스테이지에 도달한 유저가 없는 경우 해당 스테이지의 실패율은 0 으로 정의한다.

// https://school.programmers.co.kr/learn/courses/30/lessons/42889

import Foundation

// N - 스테이지 개수
// stages - 멈춰있는 스테이지의 번호 배열
func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var tuple: [(Int, Double)] = [] // (스테이지, 실패한 사람 수)
    for stage in 1...N {
        tuple.append((stage, getStuck(stage, stages)))
    }
    return tuple.sorted { $0.1 > $1.1 }.map { $0.0 }
}

// 실패율 = 스테이지 도달 but 클리어하지 못한 플레이어 수 / 스테이지 도달 플레이어 수
func getStuck(_ current: Int, _ stages: [Int]) -> Double {
    let clears = stages.filter { $0 > current }.count
    let achieved = stages.filter { $0 == current }.count
    return 1 - (Double(clears) / Double(achieved))
}

//

struct Stage {
    let number: Int
    var failureRate: Double
}

func solution(_ N: Int, _ stages: [Int]) -> [Int] {
    var userCount = Array(repeating: 0, count: N + 1) // 스테이지별 도전 중인 사용자 수를 저장하는 배열
    var failureRates = [Stage]() // 스테이지 정보를 저장하는 배열
    
    // 각 스테이지별 도전 중인 사용자 수 세기
    for stage in stages {
        userCount[stage - 1] += 1
    }
    
    // 스테이지별 실패율 계산하기
    var totalUsers = stages.count // 전체 사용자 수
    for i in 1...N {
        let failureRate = Double(userCount[i - 1]) / Double(totalUsers)
        totalUsers -= userCount[i - 1]
        
        failureRates.append(Stage(number: i, failureRate: failureRate))
    }
    
    // 실패율을 기준으로 스테이지 정렬하기
    failureRates.sort {
        if $0.failureRate == $1.failureRate {
            return $0.number < $1.number
        }
        return $0.failureRate > $1.failureRate
    }
    
    // 정렬된 스테이지 번호 반환하기
    return failureRates.map { $0.number }
}