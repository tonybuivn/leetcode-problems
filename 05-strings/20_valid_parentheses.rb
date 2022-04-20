# frozen_string_literal: true

require 'pry'

# @param {String} s
# @return {Boolean}
def valid_parentheses?(str) # rubocop:disable Metrics/MethodLength
  str = str.gsub(/\s+/, '')
  len = str.length

  return false if len.odd?

  p_map = { '{' => '}', '[' => ']', '(' => ')' }
  stack = []

  str.each_char do |c|
    if p_map[c]
      # if char is open parentheses => push to stack
      stack.push(c)
    else
      # else get last char in stack and compare with current char
      return false if p_map[stack.last] != c

      stack.pop
    end
  end
  stack.empty?
end

def optimal_valid_parentheses?(str) # rubocop:disable Metrics/MethodLength
  str = str.gsub(/\s+/, '')
  return false if str.length.odd?

  p_map = { '{' => '}', '[' => ']', '(' => ')' }
  stack = []

  str.each_char do |c|
    if p_map.keys.include?(c)
      stack.push(p_map[c])
    elsif stack.empty? || stack.pop != c
      return false
    end
  end

  stack.empty?
end

def more_optimal_valid_parentheses?(str) # rubocop:disable Metrics/MethodLength
  str = str.gsub(/\s+/, '')
  return false if str.length.odd?

  stack = []

  str.each_char do |c|
    if c == '{'
      stack.push('}')
    elsif c == '['
      stack.push(']')
    elsif c == '('
      stack.push(')')
    elsif stack.empty? || stack.pop != c
      return false
    end
  end

  stack.empty?
end

# str = '()[]{}'
# str = '(('
# str = '{ { } [ ] [ [ [ ] ] ] }'
# str = '([])'
# str = '([)]'
# str = '(]'
# str = ']'
# puts optimal_valid_parentheses?(str)
