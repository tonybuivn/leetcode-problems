# frozen_string_literal: true

require 'pry'

# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def move_zeroes(nums)
  i = 0
  tail = -1
  while i < nums.length
    if nums[i] != 0
      tail += 1
      nums[i], nums[tail] = nums[tail], nums[i] if i != tail
    end
    i += 1
  end
end

nums = [1, 0, 0, 3, 12]
move_zeroes(nums)

puts nums
