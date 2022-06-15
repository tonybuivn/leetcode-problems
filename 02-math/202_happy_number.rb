# frozen_string_literal: true

# @param {Integer} n
# @return {Boolean}
# Floyd Cycle detection algorithm
# Time complexity : 0(n)
# Space complexity : 0()
# TODO: another solution on leetcode
def is_happy(n)
  slow = n
  fast = n
  loop do
    slow = digit_square_sum(slow)
    fast = digit_square_sum(fast)
    fast = digit_square_sum(fast)
    break if slow == fast
  end

  return true if slow == 1

  false
end

def digit_square_sum(n)
  sum = 0
  while n != 0
    temp = n % 10
    sum += temp * temp
    n /= 10
  end
  sum
end

num = 19
puts is_happy(num)
