# frozen_string_literal: true

require 'pry'

# @param {Integer[][]} intervals
# @return {Integer[][]}
def merge(intervals)
  intervals.shuffle!
  quicksort_2d(intervals, 0, intervals.length - 1)

  # binding.pry
  nums = intervals.flatten
  delete_index = []
  i = 0
  while i < nums.length - 2
    if i.odd? && nums[i] >= nums[i + 1]
      delete_index << i
      delete_index << i + 1
      i += 2
    end
    i += 1
  end

  # binding.pry
  nums.reject!.with_index { |_num, i| delete_index.include?(i) }

  # binding.pry
  res = []
  i = 0
  while i < nums.length - 1
    res << [nums[i], nums[i + 1]]
    i += 2
  end
  # binding.pry
  res
end

def quicksort_2d(arr, low, high)
  return unless low < high

  # pi is partitioning index, arr[pi] is now at right place
  pi = partition_2d(arr, low, high)

  quicksort_2d(arr, low, pi - 1) # Before pi
  quicksort_2d(arr, pi + 1, high) # after pi
  arr
end

def partition_2d(arr, low, high) # rubocop:disable Metrics/MethodLength
  pivot = (arr[high][0] + arr[high][1]) / 2.0
  swap_index = low

  i = low
  while i < high
    if (arr[i][0] + arr[i][1] / 2.0) < pivot
      arr[i], arr[swap_index] = arr[swap_index], arr[i]
      swap_index += 1
    end
    i += 1
  end

  arr[swap_index], arr[high] = arr[high], arr[swap_index]
  swap_index
end

# Input: intervals = [[1,3],[2,6],[8,10],[15,18]]
# Output: [[1,6],[8,10],[15,18]]
# Explanation: Since intervals [1,3] and [2,6] overlap, merge them into [1,6].

intervals = [[1,3],[2,6],[8,10],[15,18]]
# intervals = [[1,4],[1,4]]
# intervals = [[1,4],[0,4]]
# intervals = [[1,4],[1,5]]
puts merge(intervals)

# https://leetcode.com/problems/merge-intervals/discuss/21222/A-simple-Java-solution
# https://leetcode.com/problems/merge-intervals/discuss/21227/7-lines-easy-Python
