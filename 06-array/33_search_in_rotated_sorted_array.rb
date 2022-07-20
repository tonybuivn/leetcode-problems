# frozen_string_literal: true

require 'pry'

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def search(nums, target)
  start_index = find_start_index(nums, 0, nums.length - 1)

  left_res = binary_search(nums.slice(0, start_index), target)
  right_res = binary_search(nums.slice(start_index, nums.length), target)
  right_res += start_index if right_res != -1

  [left_res, right_res].max
end

def find_start_index(nums, left, right)
  return left if nums.length == 1

  if left == right - 1
    return nums[left] > nums[right] ? right : left
  end

  mid = (left + right) / 2
  nums[mid] > nums[right] ? find_start_index(nums, mid, right) : find_start_index(nums, left, mid)
end

def binary_search(nums, target)
  left = 0
  right = nums.length - 1
  while left <= right
    mid = (left + right) / 2
    return mid if nums[mid] == target

    if target > nums[mid]
      left = mid + 1
    else
      right = mid - 1
    end
  end
  -1
end

# Input: nums = [4,5,6,7,0,1,2], target = 0
# Output: 4

# nums = [2, 4, 5, 6, 7, 0, 1]
# nums = [4, 5, 6, 7, 0, 1, 2]
# nums = [5, 6, 7, 0, 1, 2, 4]
# nums = [6, 7, 0, 1, 2, 4]
# nums = [7, 0, 1, 2, 4, 6]
# puts find_start_index(nums, 0, nums.length - 1)
nums = [1]
puts search(nums, 1)

# TODO: https://leetcode.com/problems/search-in-rotated-sorted-array/discuss/14425/Concise-O(log-N)-Binary-search-solution
