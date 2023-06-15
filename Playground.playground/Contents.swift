import Foundation

func solution(_ k:Int, _ score:[Int]) -> [Int] {
  var cache: [Int] = []
  return score.map { n in
    if cache.count < k { cache.append(n); return n }
    let num = min(cache.min()!, n)
    cache[cache.indices.first { cache[$0] <= num }!] = num
    return num
  }
}
solution(3, [10, 100, 20, 150, 1, 100, 200])
