# frozen_string_literal: true

require 'pry'

# @param {Integer[]} nums
# @return {Integer}
# O(nlogn)
def majority_element(nums)
  nums.sort!
  nums[nums.length / 2]
end

# Boyer-Moore Majority Vote Algorithm
# Time complexity : 0(n)
# Space complexity : 0(1)
def majority_element_boyer_moore(nums)
  major = 0
  count = 0
  nums.each do |num|
    if count == 0
      major = num
      count += 1
      next
    elsif major == num
      count += 1
    else
      count -= 1
    end
  end

  major
end

nums = [3, 3, 4]
# nums = %w[A A A C C B B C C C B C C]
# nums = [2, 2, 1, 1, 1, 2, 2]

puts majority_element_boyer_moore(nums)
