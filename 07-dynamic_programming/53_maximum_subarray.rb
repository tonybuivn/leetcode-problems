# frozen_string_literal: true

# Finding max element in array using Divide and Conquer
def dac_max(arr, index, len)
  if index >= len - 2
    return arr[index] > arr[index + 1] ? arr[index] : arr[index + 1]
  end

  max = dac_max(arr, index + 1, len)

  arr[index] > max ? arr[index] : max
end

# nums = [70, 250, 50, 80, 140, 12, 14]
# puts dac_max(nums, 0, 7)

# @param {Integer[]} nums
# @return {Integer}
# Kadane's Algorithm
def max_sub_array(nums)
  local_max = 0
  global_max = -1.0 / 0.0
  nums.each do |num|
    local_max = [num, num + local_max].max
    global_max = [local_max, global_max].max
  end

  global_max
end

# Input: nums = [-2, 1, -3, 4, -1, 2, 1, -5, 4]
# Output: 6
# Explanation: [4,-1,2,1] has the largest sum = 6.

nums = [-2, 1, -3, 4, -1, 2, 1, -5, 4]
puts max_sub_array(nums)

# TODO : Try to approach another methods in below post
# https://leetcode.com/problems/maximum-subarray/discuss/1595195/C%2B%2BPython-7-Simple-Solutions-w-Explanation-or-Brute-Force-%2B-DP-%2B-Kadane-%2B-Divide-and-Conquer
