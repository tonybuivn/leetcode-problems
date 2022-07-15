# frozen_string_literal: true

require 'pry'

# @param {Integer[]} nums
# @return {Integer[][]}
def subsets(nums)
  result = []
  backtrack(result, [], nums, 0)

  result
end

def backtrack(result, temp_res, nums, start)
  result << temp_res.dup

  i = start
  while i < nums.length
    temp_res << nums[i]
    backtrack(result, temp_res, nums, i + 1)
    temp_res.pop
    i += 1
  end
end

# Input: nums = [1,2,3]
# Output: [[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]

nums = [1, 2, 3]
puts subsets(nums)
