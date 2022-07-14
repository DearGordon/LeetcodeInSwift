//
//  CheckUpLowerCaseBalance.swift
//  LeetcodeInSwiftTests
//
//  Created by Gordon Feng on 3/7/2022.
//  InterViewQuestion: FoodPanda

import XCTest

class CheckUpLowerCaseBalance: XCTestCase {

    /**
     A string is called balanced when every letter occurring in the string,
     appears both in upper- and lowercase.
     For example, the string "CATattac' is balanced ('a', 'c' and 't' occur in both cases),
     but "Madam" is not ('d' and 'a' appear only in lowercase).
     Note that the number of occurrences does not matter.

     given a string S of length N, returns the length of the shortest balanced fragment of S.
     If S does not contain any balanced fragments, the function should return -1.
     */
    public func solution(_ S : inout String) -> Int {
        var count = -1
        for s in S {
            let s = Character(String(s))
            if s.isLowercase && S.contains(s.uppercased()) {
                count += 1
            }
            else if s.isUppercase && S.contains(s.uppercased()) {
                count += 1
            }
        }
        return count == -1 ? -1 : count + 1
    }

    //TODO: Finish this
    /// Assume that.
    ///  - N is an integer within the range [1.200};
    ///  - string S consists only of letters ('a'-'2' and/or 'A'-'Z').
    func test() {
        /// 1. Given S = "azABaabza", the function should return 5.
        /// The shortest balanced fragment of S is "ABaab"
        check(input: "azABaabza", expect: 5)

        /// 2. Given S = "TacoCat", the function should return -1.
        /// There is no balanced fragment.
        check(input: "TacoCat", expect: -1)

        /// 3. Given S = "AcZCbaBz" the function should return 8.
        /// The shortest balanced fragment is the whole string.
        check(input: "AcZCbaBz", expect: 8)

        /// 4. Given S = "abcdefghijklmnopqrstuvwxyz", the function should return -1
        check(input: "abcdefghijklmnopqrstuvwxyz", expect: -1)
    }

    func check(input: String, expect: Int) {
        var input = input
        XCTAssertEqual(solution(&input), expect)
    }
}

