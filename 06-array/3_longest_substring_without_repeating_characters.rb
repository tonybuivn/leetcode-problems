# frozen_string_literal: true

require 'pry'

# @param {String} str
# @return {Integer}
def length_of_longest_substring_temp(str)
  seen = {}
  longest = 0
  left = 0
  right = 0
  while right < str.length
    # If value of `right` is not in `seen`
    if !seen[str[right]]
      seen[str[right]] = right
    else
      if left <= seen[str[right]]
        # If value of `right` is in `seen`
        left = seen[str[right]] + 1
        seen[str[right]] = right
      end
    end
    longest = [longest, right - left + 1].max
    right += 1
  end
  longest
end

def length_of_longest_substring(str)
  return 0 if str.length.zero?

  seen = {}
  longest = 0
  left = 0
  right = 0
  while right < str.length
    # If value of `right` is in `seen`
    left = [left, seen[str[right]] + 1].max if seen[str[right]]
    seen[str[right]] = right
    longest = [longest, right - left + 1].max
    right += 1
  end
  longest
end

# Input: s = "abcabcbb"
# Output: 3
# Explanation: The answer is "abc", with the length of 3.

# str = 'pwwkew'
# str = 'abcabcbb'
# str = 'bbbbb'
str = 'aabaab!bb'
puts length_of_longest_substring(str)
