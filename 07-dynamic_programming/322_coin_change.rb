# frozen_string_literal: true

# @param {Integer[]} coins
# @param {Integer} amount
# @return {Integer}
def coin_change(coins, amount)
  coins.sort!
  dp = Array.new(amount + 1)
  dp[0] = 0
  int_max = 1.0 / 0.0

  i = 1
  while i <= amount
    dp[i] = int_max
    coins.each do |coin|
      break if (i - coin).negative?

      dp[i] = [dp[i], dp[i - coin] + 1].min if dp[i - coin] != int_max
    end
    i += 1
  end

  dp[amount] == int_max ? -1 : dp[amount]
end

# Input: coins = [1,2,5], amount = 11
# Output: 3
# Explanation: 11 = 5 + 5 + 1
coins = [1, 2, 5]
puts coin_change(coins, 11)

# Input: coins = [2], amount = 3
# Output: -1

# Input: coins = [1], amount = 0
# Output: 0
