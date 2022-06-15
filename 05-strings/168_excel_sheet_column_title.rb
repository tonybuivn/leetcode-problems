# frozen_string_literal: true

require 'pry'

# @param {Integer} column_number
# @return {String}
def convert_to_title(num)
  res = ''
  while num.positive?
    num -= 1
    res += (65 + num % 26).chr
    num /= 26
  end
  res.reverse
end

# puts convert_to_title(1)
# puts convert_to_title(2)
# puts convert_to_title(26)
puts convert_to_title(28)
# puts convert_to_title(701)
# puts convert_to_title(703)
