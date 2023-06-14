// 함수 solution은 정수 x와 자연수 n을 입력 받아, x부터 시작해 x씩 증가하는 숫자를 n개 지니는 리스트를 리턴해야 합니다.
// 다음 제한 조건을 보고, 조건을 만족하는 함수, solution을 완성해주세요.
// - 제한 사항
// x는 -10000000 이상, 10000000 이하인 정수입니다.
// n은 1000 이하인 자연수입니다.
// https://school.programmers.co.kr/learn/courses/30/lessons/12954

func solution(_ x:Int, _ n:Int) -> [Int64] {
    if n == 1 { return [Int64(x)] }
    return (1...n).reduce([Int64]()) {
        $0 + [Int64(x * $1)]
    }
}

// reduce의 각 파라미터는 immutable임을 잊지말자!
// $0.append(Int64(x * $1))이 아니라 $0 + [Int64(x *  $1)]처럼 해줘야함
// 더 좋은 풀이

func solution(_ x:Int, _ n:Int) -> [Int64] {
    return Array(1...n).map { Int64($0 * x) }
}

// map을 사용하면 매우 깔끔하다.