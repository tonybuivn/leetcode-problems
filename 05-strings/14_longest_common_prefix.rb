# frozen_string_literal: true

require 'pry'

# @param {String[]} strs
# @return {String}
def longest_common_prefix(strs)
  count_map = {}

  res = ''
  strs_len = strs.length
  index = 0
  while index < strs[0].length
    strs.each do |str|
      break unless str[index]

      count_map[str[index]] = 0 unless count_map[str[index]]
      count_map[str[index]] += 1
    end

    break if count_map[strs[0][index]] % strs_len != 0

    res += strs[0][index]
    index += 1
  end
  res
end

# @param {String[]} strs
# @return {String}
# Divide and Conquer
def longest_common_prefix_v2(strs)
  len = strs.length
  return strs[0] if len == 1
  return two_string_common_prefix(strs[0], strs[1]) if len == 2

  mid = (len - 1) / 2

  common_left = longest_common_prefix(strs[0..mid])
  common_right = longest_common_prefix(strs[mid + 1..len - 1])

  two_string_common_prefix(common_left, common_right)
end

def two_string_common_prefix(left, right)
  len = left.length < right.length ? left.length : right.length

  i = 0
  res = ''
  while i < len
    break if left[i] != right[i]

    res += left[i]
    i += 1
  end

  res
end

# Input: strs = ["fflower","fflow","fflight"]
# Output: "fl"

# strs = ["fflow", "fflower", "fflight"]
strs = ["dog", "racecar", "car"]
puts longest_common_prefix_v2(strs)
