# frozen_string_literal: true

# @param {Integer} row_index
# @return {Integer[]}
def get_row(row_index)
  dp = []
  dp[0] = [1]
  dp[1] = [1, 1]

  index = 2
  while index <= row_index
    dp[index] = []
    dp[index][0] = 1

    j = 1
    while j < index
      dp[index][j] = dp[index - 1][j] + dp[index - 1][j - 1]
      j += 1
    end
    dp[index][index] = 1
    index += 1
  end

  dp[row_index]
end

puts get_row(3)

# Input: rowIndex = 3
# Output: [1,3,3,1]
