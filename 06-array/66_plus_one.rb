# frozen_string_literal: true

require 'pry'

# @param {Integer[]} digits
# @return {Integer[]}
def plus_one(digits)
  i = digits.length - 1
  while i >= 0
    temp = digits[i] + 1
    if temp < 10
      digits[i] = temp
      break
    else
      digits[i] = temp - 10
    end
    digits.unshift(1) if digits[i].zero? && i.zero?
    i -= 1
  end
  digits
end

def plus_one_v2(digits)
  n = digits.length
  i = n - 1
  while i >= 0
    if digits[i] < 9
      digits[i] += 1
      return digits
    else
      digits[i] = 0
    end
    i -= 1
  end

  digits.unshift(1)
  digits
end

# digits = [1, 2, 3]
# digits = [1, 2, 9]
digits = [1, 9, 9]
# digits = [9, 9, 9]
puts plus_one_v2(digits)
