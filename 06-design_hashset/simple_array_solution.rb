# frozen_string_literal: true

require 'pry'

# MyHashSet class
class MyHashSet
  attr_accessor :container

  def initialize
    @container = []
  end

  # :type key: Integer
  # :rtype: Void
  def add(key)
    @container[key] = true
  end

  # :type key: Integer
  # :rtype: Void
  def remove(key)
    @container[key] = false
  end

  # :type key: Integer
  # :rtype: Boolean
  def contains(key)
    !!@container[key]
  end
end

# Your MyHashSet object will be instantiated and called as such:
my_hash_set = MyHashSet.new
my_hash_set.add(1)
my_hash_set.add(2)
puts my_hash_set.contains(1)
puts my_hash_set.contains(3)
my_hash_set.add(2)
puts my_hash_set.contains(2)
my_hash_set.remove(2)
puts my_hash_set.contains(2)
