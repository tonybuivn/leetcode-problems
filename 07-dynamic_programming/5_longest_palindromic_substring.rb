# frozen_string_literal: true

require 'pry'

# @param {String} str
# @return {String}
def longest_palindrome(str)
  return str if str.length < 2

  longest_len = 0
  head_res = 0

  str.each_char.with_index(0) do |_c, index|
    # assume odd length, try to extend Palindrome as possible. example "aba"
    longest_len, head_res = extend_palindrome(str, index, index, longest_len, head_res)
    # assume even length, try to extend Palindrome as possible. example "abba"
    longest_len, head_res = extend_palindrome(str, index, index + 1, longest_len, head_res)
  end

  str.slice(head_res, longest_len)
end

private

def extend_palindrome(str, head, tail, longest_len, head_res)
  while head >= 0 && tail <= str.length && str[head] == str[tail]
    head -= 1
    tail += 1
  end

  if tail - head - 1 > longest_len
    longest_len = tail - head - 1
    head_res = head + 1
  end

  return longest_len, head_res
end

# Input: s = "babad"
# Output: "bab"
# Explanation: "aba" is also a valid answer.

str = 'abcacbd'
puts longest_palindrome(str)

# TODO
# https://leetcode.com/problems/longest-palindromic-substring/discuss/2925/Python-O(n2)-method-with-some-optimization-88ms.
