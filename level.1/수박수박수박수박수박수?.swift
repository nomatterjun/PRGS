// 길이가 n이고, "수박수박수박수...."와 같은 패턴을 유지하는 문자열을 리턴하는 함수, solution을 완성하세요.
// 예를들어 n이 4이면 "수박수박"을 리턴하고 3이라면 "수박수"를 리턴하면 됩니다.
// - 제한 사항
// n은 길이 10,000이하인 자연수입니다.
// https://school.programmers.co.kr/learn/courses/30/lessons/12922

func solution(_ n:Int) -> String {
    if n % 2 == 0 {
        return String(repeating: "수박", count: n / 2)
    } else {
        return String(repeating: "수박", count: (n - 1) / 2) + "수"
    }
}