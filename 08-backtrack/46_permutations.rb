# frozen_string_literal: true

require 'pry'

# @param {Integer[]} nums
# @return {Integer[][]}
def permute(nums)
  result = []
  backtrack(result, [], nums, Array.new(nums.length))

  result
end

def backtrack(result, temp_res, nums, used)
  if temp_res.length == nums.length
    result << temp_res.dup
    return
  end

  nums.each_with_index do |num, index|
    next if used[index]

    temp_res << num
    used[index] = true
    backtrack(result, temp_res, nums, used)
    temp_res.pop
    used[index] = false
  end
end

# Input: nums = [1,2,3]
# Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]

nums = [1, 2, 3]
puts permute(nums)
