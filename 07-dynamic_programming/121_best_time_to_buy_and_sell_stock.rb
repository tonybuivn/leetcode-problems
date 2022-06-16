# frozen_string_literal: true

require 'pry'

# @param {Integer[]} prices
# @return {Integer}
# Kadane's Algorithm
def max_profit(prices)
  max_curr = 0
  max_so_far = 0

  i = 1
  while i < prices.length
    max_curr = [0, max_curr + prices[i] - prices[i - 1]].max
    max_so_far = [max_curr, max_so_far].max
    i += 1
  end

  max_so_far
end

def max_profit_v2(prices)
  min_price = 1.0 / 0.0
  max_profit = 0
  prices.each do |price|
    min_price = [price, min_price].min
    max_profit = [max_profit, price - min_price].max
  end

  max_profit
end

prices = [7, 2, 5, 1, 3, 6, 4]
puts max_profit_v2(prices)
