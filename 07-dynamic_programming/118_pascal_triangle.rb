# frozen_string_literal: true

require 'pry'

# Pascal's Triangle
# @param {Integer} num_rows
# @return {Integer[][]}
def generate(num_rows)
  dp = []
  dp[1] = [1]
  dp[2] = [1, 1]

  index = 3
  while index <= num_rows
    dp[index] = []
    dp[index][0] = 1

    j = 1
    while j < index - 1
      dp[index][j] = dp[index - 1][j] + dp[index - 1][j - 1]
      j += 1
    end
    dp[index][index - 1] = 1
    index += 1
  end

  res = []
  i = 1
  while i <= num_rows
    res << dp[i]
    i += 1
  end
  res
end

# Input: numRows = 5
# Output: [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]

puts generate(5)
