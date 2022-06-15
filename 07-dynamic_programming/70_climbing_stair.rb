# frozen_string_literal: true

# @param {Integer} n
# @return {Integer}
def climb_stairs(num)
  climb_stairs_helper(num, [])
end

def climb_stairs_helper(num, cache)
  return num if num <= 3

  cache[num] = climb_stairs_helper(num - 1, cache) + climb_stairs_helper(num - 2, cache) unless cache[num]
  cache[num]
end

# @param {Integer} num
# @return {Integer}
# iterative way
def climb_stairs_iterative(num)
  return num if num <= 3

  dp = [0, 1, 2, 3]
  (4..num).each { |n| dp[n] = dp[n - 1] + dp[n - 2] }

  dp[num]
end

puts climb_stairs_iterative(5)
