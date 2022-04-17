# frozen_string_literal: true

# @param {Integer[]} nums
# @return {Integer}
# Can use xor method
def missing_number(nums)
  len = nums.length
  expected_sum = len * (len + 1) / 2
  actual_sum = 0
  nums.each { |num| actual_sum += num }

  expected_sum - actual_sum
end

# nums = [3, 0, 1]
nums = [0, 1]
# nums = [9, 6, 4, 2, 3, 5, 7, 0, 1]

puts missing_number(nums)
