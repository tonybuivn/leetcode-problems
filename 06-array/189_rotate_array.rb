# frozen_string_literal: true

require 'pry'

# @param {Integer[]} nums
# @param {Integer} k
# @return {Void} Do not return anything, modify nums in-place instead.
# Using slice array
def rotate_v1(nums, k)
  len = nums.length
  pre = nums.slice!(len - k, len)
  nums = pre + nums
end

# Using pop and push to array
def rotate_v2(nums, k)
  k %= nums.length
  k.times do
    temp = nums.pop
    nums.unshift(temp)
  end
end

# Reverse 3 times
def rotate_v3(nums, k)
  len = nums.length
  k %= len
  reverse(nums, 0, len - 1)
  reverse(nums, 0, k - 1)
  reverse(nums, k, len - 1)
end

def reverse(nums, head, tail)
  while head < tail
    nums[head], nums[tail] = nums[tail], nums[head]
    head += 1
    tail -= 1
  end
end

# Input: nums = [1,2,3,4,5,6,7], k = 3
# Output: [5,6,7,1,2,3,4]
# Explanation:
# rotate 1 steps to the right: [7,1,2,3,4,5,6]
# rotate 2 steps to the right: [6,7,1,2,3,4,5]
# rotate 3 steps to the right: [5,6,7,1,2,3,4]

# Follow up
# - Try to come up with as many solutions as you can. There are at least three different ways to solve this problem.
# - Could you do it in-place with O(1) extra space?

# nums = [1, 2, 3, 4, 5, 6, 7]
nums = [-1, -100, 3, 99]
# reverse(nums, 0, 1)
puts rotate_v3(nums, 2)
