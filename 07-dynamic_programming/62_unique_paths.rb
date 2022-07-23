# frozen_string_literal: true

require 'pry'

# @param {Integer} m
# @param {Integer} n
# @return {Integer}
def unique_paths(rows, cols)
  curr = Array.new(cols)

  (0..cols - 1).each { |i| curr[i] = 1 }

  (1..rows - 1).each do |_row|
    (1..cols - 1).each do |col|
      curr[col] = curr[col - 1] + curr[col]
    end
  end
  # binding.pry
  curr[cols - 1]
end

# Input: m = 3, n = 7
# Output: 28

# Input: m = 3, n = 2
# Output: 3
# Explanation: From the top-left corner, there are a total of 3 ways to reach the bottom-right corner:
# 1. Right -> Down -> Down
# 2. Down -> Down -> Right
# 3. Down -> Right -> Down

puts unique_paths(4, 4)
