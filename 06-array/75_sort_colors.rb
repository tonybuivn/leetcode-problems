# frozen_string_literal: true

# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def sort_colors(nums)
  red = white = 0
  blue = nums.length - 1

  while white <= blue
    if nums[white].zero?
      nums[white], nums[red] = nums[red], nums[white]
      white += 1
      red += 1
    elsif nums[white] == 1
      white += 1
    else
      nums[white], nums[blue] = nums[blue], nums[white]
      blue -= 1
    end
  end
end

# Input: nums = [2,0,2,1,1,0]
# Output: [0,0,1,1,2,2]
# nums = [2, 0, 2, 1, 1, 0]
nums = [2, 0, 1]
sort_colors(nums)
puts nums
