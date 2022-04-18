# frozen_string_literal: true

require 'pry'
require_relative './quicksort'

# @param {Integer[]} nums
# @param {Integer} key
# @return {Integer}
def find_kth_largest(nums, key)
  len = nums.length
  return nums[0] if len == 1

  nums = nums.shuffle # to avoid worst case
  quicksort(nums, 0, len - 1)[len - key]
end

def find_kth_largest_v2(nums, key)
  nums.sort!(nums.length - key)
end

# array = [10, 80, 30, 90, 40, 50, 70]
# array = [3, 2, 3, 1, 2, 4, 5, 5, 6]
array = [1]
puts 'Array'
puts array
puts 'Kth largest element in array'
puts find_kth_largest(array, 1)
