
let deadline = 500

let inputs = readLine()!.split(separator: " ").map { Int($0)! }
let N = inputs[0] // 키트 수, 일 수
let K = inputs[1] // 감소 중량

let kits = readLine()!.split(separator: " ").map { Int($0)! } // 키트 중량 증가수
var visited = Array(repeating: false, count: N)
var result: Int = 0

func sol(_ current: Int, cnt: Int) {
  if cnt == N {
    result += 1
    return
  } else { 
    for i in (0..<N) {
      if visited[i] == false && current + kits[i] - K >= deadline {
        visited[i] = true
        sol(current + kits[i] - K, cnt: cnt + 1)
        visited[i] = false
      }
    }
  }
}

sol(deadline, cnt: 0)
print(result)
