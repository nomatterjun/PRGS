// 문자열 s는 한 개 이상의 단어로 구성되어 있습니다.
// 각 단어는 하나 이상의 공백문자로 구분되어 있습니다.
// 각 단어의 짝수번째 알파벳은 대문자로, 홀수번째 알파벳은 소문자로 바꾼 문자열을 리턴하는 함수, solution을 완성하세요.
// - 제한 사항
// 문자열 전체의 짝/홀수 인덱스가 아니라, 단어(공백을 기준)별로 짝/홀수 인덱스를 판단해야합니다.
// 첫 번째 글자는 0번째 인덱스로 보아 짝수번째 알파벳으로 처리해야 합니다.
// https://school.programmers.co.kr/learn/courses/30/lessons/12930

func solution(_ s:String) -> String {
    return s.components(separatedBy: " ").map { word in
        return strange(String(word))
    }.joined(separator: " ")
}

func strange(_ str: String) -> String {
    return str.enumerated().map { idx, char in
        idx % 2 == 0 ? char.uppercased() : char.lowercased()
    }.joined()
}

// - `split`의 경우 separator로 `String`을 넣을 수 없다.
// - `split`은 `maxSplits`로 최대 쪼갬을 제한할 수 있다.
// - `omittingEmptySubsequences`를 `false`로 하면 공백이 여러개 있더라도 무조건 하나의 공백만 분리한다. → ⚠️ 기본값이다 주의할 것