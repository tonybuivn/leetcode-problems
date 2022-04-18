# frozen_string_literal: true

# @param {Integer[]} nums
# @return {Boolean}
# complexity: O(N), memory: O(N)
def contains_duplicate(nums)
  appeared_num_hash = {}

  nums.each do |num|
    return true if appeared_num_hash[num]

    appeared_num_hash[num] = true
  end

  false
end

# array = [1, 2, 3, 1]
# array = [1, 2, 3, 4]
# array = [1, 1, 1, 3, 3, 4, 3, 2, 4, 2]

puts contains_duplicate(array)
