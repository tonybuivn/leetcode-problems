# frozen_string_literal: true

require 'pry'

# @param {String} s
# @param {String} t
# @return {Boolean}
def is_anagram(s, t)
  return false if s.length != t.length

  check_arr = Array.new(26, 0)
  s.each_char { |char| check_arr[char.ord - 'a'.ord] += 1 }
  t.each_char { |char| check_arr[char.ord - 'a'.ord] -= 1 }

  check_arr.each { |e| return false if e != 0 }
  true
end

s = 'anagram'
t = 'nagaran'

puts is_anagram(s, t)
