# frozen_string_literal: true

require 'pry'

# @param {Integer[]} nums
# @param {Integer} k
# @return {Boolean}
def contains_nearby_duplicate(nums, k)
  sliding_window = {}
  nums.each_with_index do |num, index|
    sliding_window.delete(nums[index - k - 1]) if index > k

    return true if sliding_window[num]

    sliding_window[num] = index
  end

  false
end

# nums = [1, 2, 3, 1]
# nums = [1, 0, 1, 1]
# nums = [1, 2, 3, 1, 2, 3]
nums = [4, 1, 2, 3, 1, 5]
puts contains_nearby_duplicate(nums, 1)
