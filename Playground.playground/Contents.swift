import Foundation

func solution(_ n:Int, _ a:Int, _ b:Int) -> Int {
  var a: Int = a
  var b: Int = b
  var round: Int = 1

  while !a.isMatching(with: b) {
    a = a.isEven ? a / 2 : (a + 1) / 2
    b = b.isEven ? b / 2 : (b + 1) / 2
    round += 1
  }

  return round
}

extension Int {
  var isEven: Bool {
    return self % 2 == 0
  }

  func isMatching(with num: Int) -> Bool {
    let smaller = min(self, num)
    return (self + num) / 2 == smaller
  }
}
