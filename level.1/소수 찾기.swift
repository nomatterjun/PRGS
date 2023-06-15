// 1부터 입력받은 숫자 n 사이에 있는 소수의 개수를 반환하는 함수, solution을 만들어 보세요.
// 소수는 1과 자기 자신으로만 나누어지는 수를 의미합니다.
// (1은 소수가 아닙니다.)

// - 제한 사항
// n은 2이상 1000000이하의 자연수입니다.

// https://school.programmers.co.kr/learn/courses/30/lessons/12921

func solution(_ n:Int) -> Int {
    return (1...n).reduce(0) { $1.isPrime ? $0 + 1 : $0 }
}

extension Int {
    var isPrime: Bool {
        if self == 1 { return false }
        if self == 2 || self == 3 { return true }
        for i in 2...self/2 {
            if self % i == 0 { return false }
        }
        return true
    }
}

// 위 풀이는 시간 초과...

func solution(_ n:Int) -> Int {
    var isPrimeArray = Array(repeating: true, count: n + 1)
    var primeCount = 0 

    isPrimeArray[0] = false
    isPrimeArray[1] = false
    for i in 0...n {
        if isPrimeArray[i] {
            for j in stride(from: i * 2, through: n, by: i) {
                isPrimeArray[j] = false
            }
            primeCount += 1
        }
    }

    return primeCount
}

// 에라토스테네스의 체를 사용해 풀이...