//
//  CheckPalindrome.swift
//  LeetcodeInSwiftTests
//
//  Created by Gordon Feng on 3/7/2022.
//  InterViewQuestion: FoodPanda

import XCTest

class CheckPalindrome: XCTestCase {

    /**
     Write a function solution that, given a string S of length N,
     returns any palindrome which can be obtained by replacing all of the question marks
     in S by lowercase letters ('a'-'z').
     If no palindrome can be obtained, the function should return the string "NO".

     A palindrome is a string that reads the same both forwards and backwards.
     Some examples of palindromes are: "kayak", "radar", "mom".
     */
    public func solution(_ S : inout String) -> String {
        if S.count == 1 && S.first! == "?" { return "a" }
        var lhs = 0
        var rhs = S.count - 1
        var texts = Array(S)

        while lhs <= rhs {
            if texts[lhs] == "?" && texts[rhs] != "?" {
                texts[lhs] = texts[rhs]
            } else if texts[lhs] != "?" && texts[rhs] == "?" {
                texts[rhs] = texts[lhs]
            } else if texts[lhs] != texts[rhs] {
                return "NO"
            } else if texts[lhs] == "?" && texts[rhs] == "?" {
                texts[lhs] = "a"
                texts[rhs] = "a"
            } else if lhs == rhs {
                texts[lhs] = texts[lhs] == "?" ? "a" : texts[lhs]
            }
            lhs += 1
            rhs -= 1
        }

        return String(texts)
    }

    /**
     Assume that:
     N is an integer within the range [1.. 1,000];
     string S consists only of lowercases letters ('a' - 'z') or '?'
     */
    func test_solution() {
        // Given S = "?ab??a", the function should return "aabbaa'
        check(input: "?ab??a", expect: "aabbaa")

        // Given S = "bab??a", the function should return "NO".
        check(input: "bab??a", expect: "NO")

        // Given S = "?a?", the function may return "aaa". It may also return "zaz", among other possible answers.
        check(input: "?a?", expect: "aaa")

        check(input: "", expect: "")
        check(input: "??", expect: "aa")
        check(input: "?", expect: "a")
        check(input: "a", expect: "a")
        check(input: "aa", expect: "aa")
        check(input: "????aaaa", expect: "aaaaaaaa")
        check(input: "????aaa", expect: "aaaaaaa")
        check(input: "??aabcd", expect: "NO")
        check(input: "ss?ss", expect: "ssass")
        check(input: "sdjkjf", expect: "NO")
    }

    func check(input: String, expect: String) {
        var input = input
        XCTAssertEqual(solution(&input), expect)
    }
}
