// 정수 X가 주어졌을 때, X와 구성이 같으면서 X보다 큰 수 중 가장 작은 수를 출력한다.
// 수의 구성이 같다는 말은, 수를 이루고 있는 각 자리수가 같다는 뜻이다.
// 예를 들어, 123과 321은 수의 구성이 같다. 하지만, 123과 432는 구성이 같지 않다.

class BOJ2992 {

  var numbers: [String] = []
  var visited: [Bool] = []
  var result: [String] = []

  func getInput() -> String {
    return readLine()!
  }

  func run() {
    self.numbers = self.getInput().map { String($0) }
    self.visited = Array(repeating: false, count: self.numbers.count)
    self.sol("", cnt: 0)
    let sorted: [String] = Array(Set(self.result)).sorted() + ["0"]
    print(sorted[sorted.firstIndex(of: self.numbers.joined())! + 1])
  }

  func sol(_ current: String, cnt: Int) {
    if cnt == self.numbers.count {
      self.result.append(current)
      return
    } else {
      for i in (0..<self.numbers.count) {
        if visited[i] == false {
          visited[i] = true
          self.sol(current + String(self.numbers[i]), cnt: cnt + 1)
          visited[i] = false
        }
      }
    }
  }
}

BOJ2992().run()