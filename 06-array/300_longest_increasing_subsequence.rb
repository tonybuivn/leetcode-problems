# frozen_string_literal: true

require 'pry'
require_relative '../10-search_algorithms/1_binary_search'

# @param {Integer[]} nums
# @return {Integer}
def length_of_lis(nums)
  tails = Array.new(nums.length)
  size = 0

  nums.each do |num|
    i = 0
    j = size
    while i != j
      mid = (i + j) / 2
      if tails[mid] < num
        i = mid + 1
      else
        j = mid
      end
    end

    tails[i] = num
    size += 1 if i == size
  end

  size
end

def length_of_lis_v2(nums)
  sub_nums = []
  nums.each do |num|
    if sub_nums.length == 0 || sub_nums[-1] < num
      sub_nums << num
    else
      i_left = bisearch_left(sub_nums, num)
      sub_nums[i_left] = num
    end
  end
  sub_nums.length
end

# Input: nums = [10,9,2,5,3,7,101,18]
# Output: 4
# Explanation: The longest increasing subsequence is [2,3,7,101], therefore the length is 4.

# nums = [10, 9, 2, 5, 3, 7, 101, 18]
nums = [4, 10, 4, 3, 8, 9]
puts length_of_lis_v2(nums)
