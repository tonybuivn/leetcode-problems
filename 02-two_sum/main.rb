# frozen_string_literal: true

require 'pry'

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  checked = {}
  nums.each_with_index do |value, i|
    diff = target - value

    # check if diff is in checked or not
    if checked[diff]
      return [checked[diff], i]
    else
      checked[value] = i
    end
  end
end

nums = [2, 6, 7, 11, 15]
target = 9

puts two_sum(nums, target)
