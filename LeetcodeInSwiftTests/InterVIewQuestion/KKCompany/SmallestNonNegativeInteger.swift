//
//  SmallestNonNegativeInteger.swift
//  LeetcodeInSwiftTests
//
//  Created by Gordon Feng on 20/7/2022.
//

import XCTest

class SmallestNonNegativeInteger: XCTestCase {

    ///Write a function solution that, given integer N, returns the smallest non-negative integer whose individual digits sum to N.
    public func smallestNonNegativeInteger(_ N : Int) -> Int {
        if N < 10 { return N }
        let level: Int = Int(ceil(Double(N)/9.00))
        let r = N % 9
        var result = "\(r)"

        for _ in 1...level-1 {
            result += "\(9)"
        }
        return Int(result)!
    }

    /// N is an integer within the range [0..50
    func test_smallestNonNegativeInteger() {

        //There are many numbers whose digits sum to 16 (for example: 79, 97, 808, 5551, 22822, etc.). The smallest such number is 79.
        check(input: 16, expect: 79)

        //the sum of digits is 1 + 9 + 9 = 19
        check(input: 19, expect: 199)
        check(input: 7, expect: 7)
        check(input: 0, expect: 0)
        check(input: 50, expect: 599999)
    }

    func check(input: Int, expect: Int) {
        XCTAssertEqual(smallestNonNegativeInteger(input), expect)
    }

}
