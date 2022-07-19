# frozen_string_literal: true

require 'pry'

# @param {Integer[]} candidates
# @param {Integer} target
# @return {Integer[][]}
def combination_sum(candidates, target)
  res = []

  candidates.sort!
  backtrack(res, [], candidates, target, 0)
  res
end

def backtrack(res, temp, nums, remain, start) # rubocop:disable Metrics/MethodLength
  return if remain.negative?

  if remain.zero?
    res << temp.dup
    return
  end

  i = start
  while i < nums.length
    temp << nums[i]
    backtrack(res, temp, nums, remain - nums[i], i)
    temp.pop
    break if (remain - nums[i]).negative?

    i += 1
  end
end

# Input: candidates = [2,3,5], target = 8
# Output: [[2,2,2,2],[2,3,3],[3,5]]

candidates = [2, 3, 5]
puts combination_sum(candidates, 8)
