// 지도개발팀에서 근무하는 제이지는 지도에서 도시 이름을 검색하면 해당 도시와 관련된 맛집 게시물들을 데이터베이스에서 읽어 보여주는 서비스를 개발하고 있다.
// 이 프로그램의 테스팅 업무를 담당하고 있는 어피치는 서비스를 오픈하기 전 각 로직에 대한 성능 측정을 수행하였는데, 
// 제이지가 작성한 부분 중 데이터베이스에서 게시물을 가져오는 부분의 실행시간이 너무 오래 걸린다는 것을 알게 되었다.
// 어피치는 제이지에게 해당 로직을 개선하라고 닦달하기 시작하였고, 제이지는 DB 캐시를 적용하여 성능 개선을 시도하고 있지만
// 캐시 크기를 얼마로 해야 효율적인지 몰라 난감한 상황이다.

// 어피치에게 시달리는 제이지를 도와, DB 캐시를 적용할 때 캐시 크기에 따른 실행시간 측정 프로그램을 작성하시오.

// - 입력 형식
// 캐시 크기(cacheSize)와 도시이름 배열(cities)을 입력받는다.
// cacheSize는 정수이며, 범위는 0 ≦ cacheSize ≦ 30 이다.
// cities는 도시 이름으로 이뤄진 문자열 배열로, 최대 도시 수는 100,000개이다.
// 각 도시 이름은 공백, 숫자, 특수문자 등이 없는 영문자로 구성되며, 대소문자 구분을 하지 않는다. 도시 이름은 최대 20자로 이루어져 있다.

// https://school.programmers.co.kr/learn/courses/30/lessons/17680#qna

import Foundation

func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    if cacheSize == 0 { return cities.count * 5 }
    
    var cache: [String] = []
    var head: Int = 0
    var time: Int = 0
    
    cities.forEach { city in
        let cacheTail: Int = cache.count // endIndex와 동일
        let lowercasedCity = city.lowercased()
        if cacheTail == 0 {
            time += 5
            cache.append(lowercasedCity)
        } else {
            time += cache[head...cacheTail - 1].contains(lowercasedCity) ? 1 : 5
            cache.append(lowercasedCity)
        }
        if cacheTail >= cacheSize {
            head += 1
        }
    }
    
    return time
}

// LRU와 Queue의 구현 방법이 똑같을거라 생각했는데 아니였다.
// 3, ["Jeju", "Pangyo", "SanFrancisco", "Pangyo", "Jeju"]의 경우
// 3번 인덱스의 "Pangyo"가 들어갈 때
// 정답은 ["Jeju", "SanFrancisco", "Pangyo"]의 형태가 되지만
// Queue의 경우 ["Pangyo", "SanFrancisco", "Pangyo"]가 된다.

func solution(_ cacheSize: Int, _ cities: [String]) -> Int {
    if cacheSize == 0 { return cities.count * 5 }

    var cache: [String] = []
    var time: Int = 0

    cities.forEach { city in
        let lowercasedCity = city.lowercased()

        if cache.contains(lowercasedCity) {
            // Cache hit
            time += 1
            if let index = cache.firstIndex(of: lowercasedCity) {
                cache.remove(at: index)
                cache.append(lowercasedCity)
            }
        } else {
            // Cache miss
            time += 5
            if cache.count >= cacheSize {
                cache.removeFirst()
            }
            cache.append(lowercasedCity)
        }
    }
    return time
}