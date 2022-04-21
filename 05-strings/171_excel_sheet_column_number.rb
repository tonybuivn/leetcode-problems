# frozen_string_literal: true

require 'pry'

# @param {String} column_title
# @return {Integer}
def title_to_number(str)
  str = str.split('')
  len = str.length
  res = 0
  i = 0
  while i < len
    res += (str[len - 1 - i].ord - 64) * 26**i
    i += 1
  end
  res
end

def optimal_title_to_number(str)
  res = 0
  i = 0
  str.reverse.each_char do |c|
    res += (c.ord - 64) * 26**i
    i += 1
  end
  res
end

def leetcode_optimal_title_to_number(str)
  res = 0
  i = 0
  str.each_char do |c|
    res = res * 26 + (c.ord - 64)
    i += 1
  end
  res
end

puts leetcode_optimal_title_to_number('A')
puts leetcode_optimal_title_to_number('B')
puts leetcode_optimal_title_to_number('Z')
puts leetcode_optimal_title_to_number('AB')
puts leetcode_optimal_title_to_number('ZY')
