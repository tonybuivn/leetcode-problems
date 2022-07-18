# frozen_string_literal: true

require 'pry'

# @param {String} digits
# @return {String[]}
def letter_combinations(digits)
  return [] if digits.empty?

  number_map = {
    '2' => %w[a b c],
    '3' => %w[d e f],
    '4' => %w[g h i],
    '5' => %w[j k l],
    '6' => %w[m n o],
    '7' => %w[p q r s],
    '8' => %w[t u v],
    '9' => %w[w x y z]
  }
  res = []
  backtrack(res, '', digits, number_map, 0)

  res
end

def backtrack(res, temp, digits, number_map, start)
  if temp.length == digits.length
    res << temp.dup
    return
  end

  i = start
  while i < digits.length
    number_map[digits[i]].each do |char|
      temp += char
      backtrack(res, temp, digits, number_map, i + 1)
      temp.chop!
    end
    i += 1
  end
end

# Input: digits = "23"
# Output: ["ad","ae","af","bd","be","bf","cd","ce","cf"]
puts letter_combinations('2')

# TODO: https://leetcode.com/problems/letter-combinations-of-a-phone-number/discuss/8064/My-java-solution-with-FIFO-queue
# https://leetcode.com/problems/letter-combinations-of-a-phone-number/discuss/780232/Backtracking-Python-problems%2B-solutions-interview-prep