# frozen_string_literal: true

# @param {Integer} n
# @return {Integer}
def fib(num)
  fib_helper(num, [])
end

def fib_helper(num, fib_cache)
  return num if num <= 1

  fib_cache[num] = fib_helper((num - 1), fib_cache) + fib_helper((num - 2), fib_cache) unless fib_cache[num]
  fib_cache[num]
end

puts fib(3)
puts fib(4)
puts fib(5)
