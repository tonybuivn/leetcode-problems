# frozen_string_literal: true

require 'pry'

# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def move_zeroes(nums)
  tail = -1

  nums.each_with_index do |num, index|
    if num != 0
      tail += 1
      nums[index], nums[tail] = nums[tail], nums[index] if index != tail
    end
  end
end

nums = [1, 0, 0, 3, 12]
move_zeroes(nums)

puts nums
