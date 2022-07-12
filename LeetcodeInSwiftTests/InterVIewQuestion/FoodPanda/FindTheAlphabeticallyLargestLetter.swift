//
//  FindTheAlphabeticallyLargestLetter.swift
//  LeetcodeInSwiftTests
//
//  Created by Gordon Feng on 12/7/2022.
//

import XCTest

class FindTheAlphabeticallyLargestLetter: XCTestCase {

    /// We are given a string S consisting of N letters. We want to find the alphabetically largest letter that occurs in both lowercase and uppercase in S, or decide that there is no such letter. Note: One letter is alphabetically larger than another if it occurs later in English alphabetical order. For example, "E" is alphabetically larger than "B"
    func solution(_ s: String) -> String {
        var set: Set<String> = []
        var result = ""
        for c in s {
            if c.isUppercase && set.contains(c.lowercased()) && result < String(c) {
                result = String(c)
            } else if c.isLowercase && set.contains(c.uppercased()) && result < String(c) {
                result = String(c)
            }
            set.insert(String(c))
        }
        return result.isEmpty ? "NO" : result.uppercased()
    }

    /// given a string S, returns a string consisting of one letter - the alphabetically largest of all letters that occur in both lowercase and uppercase in S. The returned letter should be in uppercase. If there is no such letter. the unction should return "NO
    func test_solution() {

         //Letters occurring in both lowercase and uppercase are: "A", "B" ("B" is alphabetically largest).
        check(input: "aaBabcDaA", expect: "B")

        //There is no letter that occurs in both lowercase and uppercase.
        check(input: "Codility", expect: "NO")

        //Letters occurring in both lowercase and uppercase are: "E", "T" ("T" is alphabetically largest).
        check(input: "WeTestCodErs", expect: "T")
    }

    func check(input: String, expect: String) {
        XCTAssertEqual(solution(input), expect)
    }
}
