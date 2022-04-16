# frozen_string_literal: true

require 'pry'

# Node class
class HashSetNode
  attr_accessor :key, :next

  def initialize(key, _next = nil)
    @key = key
    @next = _next
  end
end

# MyHashSet class
class MyHashSet
  attr_accessor :head

  def initialize
    @head = nil
  end

  # :type key: Integer
  # :rtype: Void
  def add(key)
    # if empty hashset
    if @head.nil?
      @head = HashSetNode.new(key)
      return
    elsif !contains(key)
      curr = @head
      curr = curr.next while curr.next
      curr.next = HashSetNode.new(key)
    end
  end

  # :type key: Integer
  # :rtype: Void
  def remove(key)
    return unless @head

    if @head.key == key
      @head = @head.next
      return
    else
      curr = @head
      curr.next.key == key ? curr.next = curr.next.next : curr = curr.next while curr.next
    end
  end

  # :type key: Integer
  # :rtype: Boolean
  def contains(key)
    # return false unless @head
    # return true if @head.key == key

    curr = @head
    while curr
      return true if curr.key == key

      curr = curr.next
    end
    false
  end

  def print_hashset
    unless @head
      puts []
      return
    end

    curr = @head
    loop do
      puts curr.key
      break unless curr.next

      curr = curr.next
    end
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
