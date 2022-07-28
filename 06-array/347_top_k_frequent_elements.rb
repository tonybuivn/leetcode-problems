# frozen_string_literal: true

require 'pry'

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer[]}
def top_k_frequent(nums, k)
  freq_map = {}
  bucket = Array.new(nums.length + 1)
  res = []

  # build frequency map
  nums.each { |num| freq_map[num] = freq_map[num].nil? ? 1 : freq_map[num] + 1 }

  # build bucket
  freq_map.each_key do |key|
    freq = freq_map[key]
    bucket[freq] = [] if bucket[freq].nil?
    bucket[freq] << key
  end

  pos = bucket.length - 1
  while pos >= 0 && res.length < k
    res += bucket[pos] if bucket[pos] != nil
    pos -= 1
  end
  res
end

# Input: nums = [1,1,1,2,2,3], k = 2
# Output: [1,2]

# [1,2]
# 2

# nums = [1, 1, 1, 2, 2, 3, 3, 3, 3]
nums = [1, 2]
puts top_k_frequent(nums, 2)
