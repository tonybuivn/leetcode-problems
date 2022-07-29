# frozen_string_literal: true

# @param {Integer[]} nums
# @return {Integer}
def longest_consecutive(nums)
  freq_map = {}
  nums.each { |num| freq_map[num] = freq_map[num].nil? ? 1 : freq_map[num] + 1 }
  best = 0

  freq_map.each_key do |key|
    next unless freq_map[key - 1].nil?

    y = key + 1
    y += 1 until freq_map[y].nil?
    best = [best, y - key].max
  end
  best
end

# Input: nums = [100,4,200,1,3,2]
# Output: 4
# Explanation: The longest consecutive elements sequence is [1, 2, 3, 4]. Therefore its length is 4.

nums = [100, 4, 200, 1, 3, 2]
puts longest_consecutive(nums)
