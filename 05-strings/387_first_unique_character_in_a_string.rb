# frozen_string_literal: true

require 'pry'

# @param {String} s
# @return {Integer}
def first_uniq_char(str) # rubocop:disable Metrics/MethodLength
  repeated_check = {}

  str.each_char { |c| repeated_check[c].nil? ? repeated_check[c] = 1 : repeated_check[c] += 1 }

  char = repeated_check.key(1)
  if char
    i = 0
    str.each_char do |c|
      return i if c == char

      i += 1
    end
  end

  -1
end

def first_uniq_char_v2(str) # rubocop:disable Metrics/MethodLength
  repeated_check = []
  str.each_char do |c|
    index = c.ord - 'a'.ord
    repeated_check[index] = repeated_check[index].to_i + 1
  end

  i = 0
  str.each_char do |c|
    index = c.ord - 'a'.ord
    return i if repeated_check[index] == 1

    i += 1
  end
  -1
end

# TODO : re-do using 2 pointer method
# https://leetcode.com/problems/first-unique-character-in-a-string/discuss/86340/Java-two-pointers-(slow-and-fast)-solution-(18-ms)

str = 'loveleetcode'
puts first_uniq_char_v2(str)
