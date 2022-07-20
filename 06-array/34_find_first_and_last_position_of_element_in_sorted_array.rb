# frozen_string_literal: true

require 'pry'

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def search_range(nums, target)
  res = [1.0 / 0.0, -1]
  binary_search(nums, 0, nums.length - 1, target, res)

  res[0] = -1 if res[0] == (1.0 / 0.0)
  res
end

def binary_search(nums, left, right, target, res)
  mid = (left + right) / 2

  binding.pry
  if nums[mid] == target
    binding.pry
    if nums[mid - 1].nil? || nums[mid - 1] < target
      res[0] = mid
    elsif nums[mid - 1] == target && res[0] > mid - 1
      binary_search(nums, left, mid - 1, target, res)
    end

    if nums[mid + 1].nil? || nums[mid + 1] > target
      res[1] = mid
    elsif nums[mid + 1] == target && res[1] < mid + 1
      binary_search(nums, mid + 1, right, target, res)
    end

  elsif nums[mid] < target && mid < nums.length
    binding.pry
    binary_search(nums, mid + 1, right, target, res)
  elsif nums[mid] > target && mid >= 0
    binding.pry
    binary_search(nums, left, mid - 1, target, res)
  end
end

# Input: nums = [5,7,7,8,8,10], target = 8
# Output: [3,4]

nums = [5, 7, 7, 8, 8, 10]
puts search_range(nums, 8)

# https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/discuss/14699/Clean-iterative-solution-with-two-binary-searches-(with-explanation)
