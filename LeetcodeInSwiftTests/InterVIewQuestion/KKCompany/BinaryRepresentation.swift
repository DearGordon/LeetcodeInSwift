//
//  BinaryRepresentation.swift
//  LeetcodeInSwiftTests
//
//  Created by Gordon Feng on 20/7/2022.
//

import XCTest

class BinaryRepresentation: XCTestCase {

    /// You are given a string S of length N which encodes a non-negative number V in a binary form. Two types of operations may be performed on it to modify its value:
    ///
    /// if V is odd, subtract 1 from it;
    /// if V is even, divide it by 2;
    ///
    /// These operations are performed until the value of V become 0.
    ///
    /// For example: if string S = "011100", its value initially is 28, The value if V would change as follows:
    ///
    ///  1. V = 28, which is even: divide by 2 to obtain 14;
    ///  2. V = 14, which is even: divide by 2 to obtain 7;
    ///  3. V = 7, which is odd: subtract 1 to obtain 6;
    ///  4. V = 6, which is even: divide by 2 to obtain 3;
    ///  5. V = 3, which is odd: subtract 1 to obtain 2;
    ///  6. V = 2, which is even: divide by 2 to obtain 1;
    ///  7. V = 1, which is odd: subtract 1 to obtain 0;
    ///
    /// Seven operations were required to reduce the value of V to 0
    ///
    /// That, given a string S consisting of N characters containing a binary representation of the initial value V, returns the number of operations after which its value will become 0.
    public func solution(_ S : inout String) -> Int {

//        let arr: [Character] = Array(S)
//        var sum = 0.0
//
//        for (index, i) in (0..<arr.count).reversed().enumerated() {
//            if arr[index] == "1" {
//                sum += pow(2.0, Double(i))
//            }
//        }
        return 0
    }

    func test_solution() {
        check(input: "011100", expect: 7)
        check(input: "111", expect: 5)
        check(input: "1111010101111", expect: 22)
        check(input: String(repeating: "1", count: 400000), expect: 799999)
    }

    func check(input: String, expect: Int) {
        var input = input
        XCTAssertEqual(solution(&input), expect)
    }
}
