# frozen_string_literal: true

require 'pry'

# @param {Integer[]} nums
# @return {Integer}
def remove_duplicates(nums)
  new_tail = 0
  i = 1
  len = nums.length
  while i < len
    if nums[i] != nums[new_tail]
      new_tail += 1
      nums[new_tail] = nums[i]
    end
    i += 1
  end
  # binding.pry
  nums.slice!(new_tail + 1, len)
  new_tail + 1
end

nums = [0, 0, 1, 1, 1, 2, 2, 3, 3, 4]
k = remove_duplicates(nums)

puts "k = #{k}"
puts 'nums'
puts nums
