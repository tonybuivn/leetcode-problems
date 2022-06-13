# frozen_string_literal: true

require 'pry'

# @param {Integer[]} nums
# @param {Integer} k
# @return {Float}
# Using sliding window
def find_max_average(nums, k)
  # Calculate sum of first window of size k
  max_sum = 0
  (0..k - 1).each do |index|
    max_sum += nums[index]
  end

  # Calculate sum of remaining window by removing the first element
  # of previous window and adding the last element of current window
  i = k
  sum = max_sum
  while i < nums.length
    sum = sum - nums[i - k] + nums[i]
    max_sum = sum if sum > max_sum
    i += 1
  end

  max_sum / 1.0 / k
end

# Input: nums = [1,12,-5,-6,50,3], k = 4
# Output: 12.75000
# Explanation: Maximum average is (12 - 5 - 6 + 50) / 4 = 51 / 4 = 12.75

nums = [1, 12, -5, -6, 50, 3]
puts find_max_average(nums, 4)
