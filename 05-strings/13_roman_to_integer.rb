# frozen_string_literal: true

require 'pry'

# @param {String} s
# @return {Integer}
def roman_to_int(roman_str) # rubocop:disable Metrics/AbcSize
  roman = { 'I' => 1, 'V' => 5, 'X' => 10, 'L' => 50, 'C' => 100, 'D' => 500, 'M' => 1000 }

  array = roman_str.split('')
  sum = 0
  len = array.length

  i = 0
  while i < len - 1
    roman[array[i]] < roman[array[i + 1]] ? sum -= roman[array[i]] : sum += roman[array[i]]
    i += 1
  end
  sum + roman[array[-1]]
end

puts roman_to_int('III')
puts roman_to_int('IV')
puts roman_to_int('VI')
puts roman_to_int('XIV')
puts roman_to_int('XXVI')
puts roman_to_int('LIV')
