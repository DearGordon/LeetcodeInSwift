//
//  SplitStringIntoMinimalNumberOfSubstrings.swift
//  LeetcodeInSwiftTests
//
//  Created by Gordon Feng on 20/7/2022.
//

import XCTest

class SplitStringIntoMinimalNumberOfSubstrings: XCTestCase {

    /// You are given a string consisting of lowercase letters of the English alphabet. You must split this string into a minimal number of substrings in such a way that no letter occurs more than once in each substring. For example, here are some correct splits of the string "abacdec": ('a', 'bac', 'dec'), ('a', bacd', 'ec') and ('ab', ac, 'dec').
    ///
    /// that. even a string > or length N. returns the minimum number or substrings into which the string has to be solit
    public func solution(_ S : inout String) -> Int {
        let set: Set<Character> = Set(Array(S))
        if set.count == S.count { return 1 }
        if set.count == 1 { return S.count }

        var list: Set<Character> = []
        var count = 1

        for t in S {
            if list.contains(t) {
                count += 1
                list.removeAll()
            } else {
                list.insert(t)
            }
        }
        return count
    }

    func test_solution() {
        // Here is no need to split the string into substrings as all letters occur lust once
        check(input: "word", expect: 1)

        // The result can be achieved by splitting the string into four substrings (d, d, d, d)
        check(input: "dddd", expect: 4)

        // I he result can be achieved by splitting the string into two substrings (cy. cle or (c, ycle).
        check(input: "cycle", expect: 2)

        // The result can be achieved by splitting the String into two substrings (ab, ba)
        check(input: "abba", expect: 2)
    }

    func check(input: String, expect: Int) {
        var input = input
        XCTAssertEqual(solution(&input), expect)
    }

}
