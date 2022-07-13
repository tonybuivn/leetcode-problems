# frozen_string_literal: true

require 'pry'
require 'set'

def two_sum(nums, target)
  return [] if nums.length < 2

  checked = {}
  res = Set.new

  nums.each_with_index do |num, index|
    diff = target - num

    if checked[diff]
      res << [diff, num]
    else
      checked[num] = index
    end
  end
  res
end

# @param {Integer[]} nums
# @return {Integer[][]}
def three_sum(nums)
  len = nums.length
  return [] if len < 3

  result = []
  nums.sort!
  index = 0
  while index < len - 2
    sum_2_res = two_sum(nums.slice(index + 1, len - 1), 0 - nums[index])
    sum_2_res.each do |sum2|
      sum2 << nums[index]
      result << sum2
    end
    curr = nums[index]

    loop do
      index += 1
      break if nums[index] != curr
    end
  end

  binding.pry
  result
end

# nums = [2, 3, 7, 6, 8]
# nums = [-1, 0, 1, 2, -1, -4]
nums = [-1, 0, -4, -1, -1, 3, 2, 1, 2]
# nums = [-1, -1, 0, 1, 2, 2, 3]
puts three_sum(nums)
