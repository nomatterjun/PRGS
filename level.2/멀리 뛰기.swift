// 효진이는 멀리 뛰기를 연습하고 있습니다. 효진이는 한번에 1칸, 또는 2칸을 뛸 수 있습니다. 칸이 총 4개 있을 때, 효진이는
// (1칸, 1칸, 1칸, 1칸)
// (1칸, 2칸, 1칸)
// (1칸, 1칸, 2칸)
// (2칸, 1칸, 1칸)
// (2칸, 2칸)
// 의 5가지 방법으로 맨 끝 칸에 도달할 수 있습니다. 멀리뛰기에 사용될 칸의 수 n이 주어질 때, 효진이가 끝에 도달하는 방법이 몇 가지인지 알아내, 여기에 1234567를 나눈 나머지를 리턴하는 함수, solution을 완성하세요. 예를 들어 4가 입력된다면, 5를 return하면 됩니다.

// - 제한 사항
// n은 1 이상, 2000 이하인 정수입니다.

// https://school.programmers.co.kr/learn/courses/30/lessons/12914

func solution(_ n: Int) -> Int {
    var count: Int = 0
    
    dfs(&count, [], 1, goal: n)
    dfs(&count, [], 2, goal: n)
    
    return count
}

func dfs(_ count: inout Int, _ arr: [Int], _ n: Int, goal: Int) {
    var arr = arr + [n]
    let sum = arr.reduce(0, +)
    if sum >= goal {
        if sum == goal { count += 1 }
        return
    }
    
    dfs(&count, arr, 1, goal: goal)
    dfs(&count, arr, 2, goal: goal)
}

// DFS 문제다! 하고 냉큼 풀었는데 시간 초과..
// 조합과 피보나치로 푸는 것이 훨씬 쉽다고 한다..

func solution(_ n: Int) -> Int {
    var result = [1, 2]
    var i = 0
    
    while result.count < n {
        result.append((result[i] + result[i+1]) % 1234567)
        i += 1
    }
    return result[n-1]
}