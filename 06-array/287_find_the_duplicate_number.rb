# frozen_string_literal: true

require 'pry'

# @param {Integer[]} nums
# @return {Integer}
# using hash table
def find_duplicate_v1(nums)
  check_map = {}
  nums.each do |num|
    return num if check_map[num]

    check_map[num] = 1
  end
end

# @param {Integer[]} nums
# @return {Integer}
# using sort
def find_duplicate_v2(nums)
  nums.sort

  nums.each_with_index do |num, index|
    return num if num == nums[index + 1]
  end
end

# @param {Integer[]} nums
# @return {Integer}
# using two pointer
def find_duplicate_v3(nums)
  slow = 0
  fast = 0

  loop do
    slow = nums[slow]
    fast = nums[nums[fast]]
    break if slow == fast
  end

  slow = 0
  while slow != fast
    slow = nums[slow]
    fast = nums[fast]
  end

  slow
end

# Input: nums = [1,3,4,2,2]
# Output: 2

nums = [1, 3, 4, 2, 2]
puts find_duplicate_v3(nums)
