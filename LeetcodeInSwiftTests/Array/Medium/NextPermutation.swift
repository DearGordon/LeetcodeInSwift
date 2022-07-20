//
//  NextPermutation.swift
//  LeetcodeInSwiftTests
//
//  Created by Gordon Feng on 17/7/2022.
//  https://leetcode.com/problems/next-permutation/

import XCTest

class NextPermutation: XCTestCase {

    /// A permutation of an array of integers is an arrangement of its members into a sequence or linear order.
    ///
    /// - For example, for arr = [1,2,3], the following are considered permutations of arr: [1,2,3], [1,3,2], [3,1,2], [2,3,1].
    ///
    ///The next permutation of an array of integers is the next lexicographically greater permutation of its integer. More formally, if all the permutations of the array are sorted in one container according to their lexicographical order, then the next permutation of that array is the permutation that follows it in the sorted container. If such arrangement is not possible, the array must be rearranged as the lowest possible order (i.e., sorted in ascending order).
    ///
    /// - For example, the next permutation of arr = [1,2,3] is [1,3,2].
    /// - Similarly, the next permutation of arr = [2,3,1] is [3,1,2].
    /// - While the next permutation of arr = [3,2,1] is [1,2,3] because [3,2,1] does not have a lexicographical larger rearrangement.
    ///
    ///Given an array of integers nums, find the next permutation of nums.
    ///
    ///The replacement must be in place and use only constant extra memory.
    func nextPermutation(_ nums: inout [Int]) {
        let len = nums.count
        var lhs = -1, rhs = -1, idx = len - 2
        while idx >= 0 {
            if nums[idx] < nums[idx + 1] { lhs = idx; break }
            idx -= 1
        }
        if lhs == -1 { nums = nums.reversed(); return }

        idx = len - 1
        while idx > lhs {
            rhs = idx
            if nums[idx] > nums[lhs] { break }
            idx -= 1
        }
        nums.swapAt(lhs, rhs)
        nums.replaceSubrange(lhs + 1..<len, with: nums[lhs + 1...len - 1].reversed())
    }

    /// Constraints:
    ///  - 1 <= nums.length <= 100
    ///  - 0 <= nums[i] <= 100
    func test_nextPermutation() {
        /// 1,2,3  1,3,2  3,2,1  3,1,2  2,3,1  2,1,3
        /// <1,2,3>  [1,3,2]  2,1,3  2,3,1  3,1,2  3,2,1
        check(input: [1,2,3], expect: [1,3,2])

        // 3,2,1  3,1,2  1,3,2  1,2,3  2,1,3  2,3,1
        // [1,2,3]  1,3,2  2,1,3  2,3,1  3,1,2  <3,2,1>
        check(input: [3,2,1], expect: [1,2,3])

        // 1,1,5  1,5,1  5,1,1
        // <1,1,5>  [1,5,1]  5,1,1
        check(input: [1,1,5], expect: [1,5,1])

        // 1,2,3  <1,3,2>  [2,1,3]  2,3,1  3,1,2  3,2,1
        check(input: [1,3,2], expect: [2,1,3])
    }

    func check(input: [Int], expect: [Int]) {
        var result = input
        nextPermutation(&result)
        XCTAssertEqual(result, expect)
    }
}
