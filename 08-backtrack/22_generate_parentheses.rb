# frozen_string_literal: true

require 'pry'

# @param {Integer} num
# @return {String[]}
def generate_parenthesis(num)
  result = []
  backtrack(result, '', 0, 0, num)

  result
end

def backtrack(result, str, head, tail, max)
  if str.length == max * 2
    result << str
    return
  end

  backtrack(result, "#{str}(", head + 1, tail, max) if head < max
  backtrack(result, "#{str})", head, tail + 1, max) if tail < head
end

puts generate_parenthesis(4)
