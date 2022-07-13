# frozen_string_literal: true

def permutation?(str1, str2)
  return false unless str1.length == str2.length

  appearence = {}

  str1.each_char do |c|
    appearence[c] += 1
  end

  str2.each_char do |c|
    return false unless appearence[c]
    appearence[c] -= 1
  end
end
