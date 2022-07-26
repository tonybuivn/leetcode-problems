# frozen_string_literal: true

require 'pry'

# @param {Integer[][]} grid
# @return {Integer}
def min_path_sum(grid)
  cols = grid[0].length
  rows = grid.length

  return 0 if grid.empty?
  return grid[0][0] if cols == 1 && rows == 1

  dp = [[grid[0][0]]]
  (1..cols - 1).each { |col| dp[0][col] = dp[0][col - 1] + grid[0][col] }
  (1..rows - 1).each { |row| dp << [dp[row - 1][0] + grid[row][0]] }

  (1..rows - 1).each do |row|
    (1..cols - 1).each do |col|
      dp[row][col] = [dp[row - 1][col], dp[row][col - 1]].min + grid[row][col]
    end
  end

  dp[rows - 1][cols - 1]
end

# Input: grid = [[1,3,1],[1,5,1],[4,2,1]]
# Output: 7
# Explanation: Because the path 1 → 3 → 1 → 1 → 1 minimizes the sum.
# grid = [[1, 3, 1], [1, 5, 1], [4, 2, 1]]
grid = [[1, 2, 3], [4, 5, 6]]
puts min_path_sum(grid)

# TODO: https://leetcode.com/problems/minimum-path-sum/discuss/23457/C%2B%2B-DP
