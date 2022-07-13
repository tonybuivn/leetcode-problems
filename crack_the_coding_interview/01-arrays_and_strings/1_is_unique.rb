# frozen_string_literal: true

# Using hash_table
# Time complexity : O(n)
# Sapce complexity : O(n)
def unique_v1?(str)
  char_map = {}
  str.each_char { |c| char_map[c] = 1 }

  char_map.size == str.length
end

def unique_v2?(str)
  char_map = {}
  str.each_char do |c|
    return false if char_map[c]

    char_map[c] = 1
  end
  true
end

str = 'abca'
puts unique_v2?(str)
