# frozen_string_literal: true

require 'pry'

# @param {Integer[]} nums
# @return {Integer}
def max_product(nums)
  pre = suf = 0
  res = nums[0]
  i = 0
  while i < nums.length
    pre = (pre.zero? ? 1 : pre) * nums[i]
    suf = (suf.zero? ? 1 : suf) * nums[nums.length - 1 - i]
    res = [res, [pre, suf].max].max
    i += 1
  end
  res
end

# Input: nums = [2,3,-2,4]
# Output: 6
# Explanation: [2,3] has the largest product 6.

nums = [2, 3, -2, 4]
puts max_product(nums)

# TODO: https://leetcode.com/problems/maximum-product-subarray/discuss/48230/Possibly-simplest-solution-with-O(n)-time-complexity
