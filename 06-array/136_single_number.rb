# frozen_string_literal: true

require 'pry'

# @param {Integer[]} nums
# @return {Integer}
def single_number(nums)
  hash = {}

  nums.each do |num|
    is_duplicated = hash[num].nil? ? false : true
    hash.merge!(num => is_duplicated)
  end

  hash.key(false)
end

def single_number_xor(nums)
  res = 0
  len = nums.length
  i = 0
  while i < len
    res ^= nums[i]
    i += 1
  end
  res
end

# nums = [2, 2, 1]
nums = [4, 1, 2, 1, 2]
# nums = [1]
puts single_number_xor(nums)
