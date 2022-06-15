# frozen_string_literal: true

# @param {Character[]} s
# @return {Void} Do not return anything, modify s in-place instead.
def reverse_string(str)
  len = str.length

  i = 0
  while i < len / 2
    str[i], str[len - 1 - i] = str[len - 1 - i], str[i]
    i += 1
  end
end

# str = ['a', 'b', 'c', 'd']
# str = ['a', 'b', 'c', 'd', 'e']
# reverse_string(str)
# str.each { |c| puts c }
