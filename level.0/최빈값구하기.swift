// https://school.programmers.co.kr/learn/courses/30/lessons/120812
// Dictionary를 다루기 위한 문제
// Dictionary(grouping:by:)

import Foundation

func solution(_ array:[Int]) -> Int {
    guard array.count > 1 else { return array[0] }
    let dict = Dictionary(grouping: array, by: { $0 })
        .sorted { $0.value.count > $1.value.count }
    guard dict.count > 1 else { return dict[0].key }
    return dict[0].value.count == dict[1].value.count ? -1 : dict[0].key
}
