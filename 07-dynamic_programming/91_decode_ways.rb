# frozen_string_literal: true

require 'pry'

# @param {String} str
# @return {Integer}
def num_decodings_v1(str)
  if str.length == 1
    return str.to_i.positive? ? 1 : 0
  end

  num1 = 0
  num2 = 0
  num1 = num_decodings(str[1..-1]) if str[0].to_i.positive?
  if str[0..1].to_i < 27
    num2 = str[2..-1].eql?('') ? 1 : num_decodings(str[2..-1])
  end

  num1 + num2
end

def num_decodings(str)
  return 0 if str.nil? || str.empty?

  len = str.length
  dp = []
  dp[0] = 1
  dp[1] = str[0].eql?('0') ? 0 : 1

  i = 2
  while i <= len
    first = str[i - 1..i - 1].to_i
    second = str[i - 2..i - 1].to_i
    dp[i] = 0
    dp[i] += dp[i - 1] if first >= 1 && first <= 9
    dp[i] += dp[i - 2] if second >= 10 && second <= 26
    i += 1
  end

  dp[len]
end

# Input: s = "226"
# Output: 3
# Explanation: "226" could be decoded as "BZ" (2 26), "VF" (22 6), or "BBF" (2 2 6)

# 'A' -> "1"
# 'B' -> "2"
# ...
# 'Z' -> "26"

str = '216'
# str = '10'
# str = '210'
puts num_decodings(str)
