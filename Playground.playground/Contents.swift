import Foundation

func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
  let numbers1 = convert(arr1)
  let numbers2 = convert(arr2)
  let secretMap: [String] = zip(numbers1, numbers2).map { number1, number2 in
    return combine(number1, number2)
  }
  return secretMap.map {
    let f = $0.replacingOccurrences(of: "1", with: "#")
    return f.replacingOccurrences(of: "0", with: " ")
  }
}

func combine(_ str1: String, _ str2: String) -> String {
  let number1 = str1.map { Int(String($0))! }
  let number2 = str2.map { Int(String($0))! }
  let result = zip(number1, number2).map { min($0 + $1, 1) }
  return result.map { String($0) }.joined()
}

func convert(_ nums: [Int]) -> [String] {
  let binaries = nums.map { String($0, radix: 2) }

  return binaries.map { binary in
    if binary.count == 5 {
      return binary
    } else {
      return String(repeating: "0", count: 5 - binary.count) + binary
    }
  }
}

solution(6, [46, 33, 33 ,22, 31, 50], [27 ,56, 19, 14, 14, 10])
