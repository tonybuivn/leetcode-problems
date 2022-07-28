# frozen_string_literal: true

require 'pry'

# @param {Integer[]} nums
# @return {Integer[]}
def product_except_self(nums)
  len = nums.length
  left = Array.new(len)
  left[0] = 1

  i = 1
  while i < len
    left[i] = left[i - 1] * nums[i - 1]
    i += 1
  end

  right = 1
  i = len - 1
  while i >= 0
    left[i] = right * left[i]
    right *= nums[i]
    i -= 1
  end
  left
end

# Input: nums = [1,2,3,4]
# Output: [24,12,8,6]

nums = [1, 2, 3, 4]
puts product_except_self(nums)
