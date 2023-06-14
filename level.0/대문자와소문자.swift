// https://school.programmers.co.kr/learn/courses/30/lessons/120893
// isLowercase는 Character 타입에 사용할 수 있다.

import Foundation

func solution(_ my_string:String) -> String {
    return my_string.map{ $0.isLowercase ? String($0).uppercased() : String($0).lowercased() }.joined()
}