# frozen_string_literal: true

# @param {String} s
# @return {Boolean}
def palindrome?(str)
  converted_str = str.gsub(/[^0-9a-z]/i, '').downcase
  converted_str.reverse == converted_str
end

s1 = 'A man, a plan, a canal: Panama'

puts palindrome?(s1)
