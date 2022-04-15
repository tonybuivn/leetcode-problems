# frozen_string_literal: true

require 'pry'

# LRU Cache class
class LRUCache
  attr_accessor :capacity, :head, :tail, :cache_hash

  # capacity: Integer
  def initialize(capacity)
    @capacity = capacity
    @head = nil
    @tail = nil
    @cache_hash = {}
    @counter = 0
  end

  # @param {Integer} key
  # @return {Integer} value
  def get(key)
    node = @cache_hash[key]
    return -1 unless node

    move_to_head(node)
    node.value
  end

  # @param {Integer} key
  # @param {Integer} value
  # @return Void
  def put(key, value) # rubocop:disable Metrics/MethodLength
    node = CacheNode.new(key, value)

    # if cache empty then put to head
    if @counter.zero?
      @tail = node
    else
      remove_tail_from_cache if @counter >= @capacity
      node.next_node = @head
      @head.prev_node = node if @head
    end
    @head = node
    @cache_hash[key] = node
    @counter += 1
  end

  private

  def move_to_head(node) # rubocop:disable Metrics/MethodLength
    return if node.key == @head.key

    prev_node = node.prev_node
    # if node is tail and not head
    if @tail.key == node.key
      prev_node.next_node = nil
      @tail = prev_node
    else
      next_node = node.next_node
      prev_node.next_node = next_node
      next_node.prev_node = prev_node
    end

    node.next_node = @head
    node.prev_node = nil
    @head.prev_node = node
    @head = node
  end

  def remove_tail_from_cache
    @cache_hash.delete(@tail.key)
    @counter -= 1
    if @counter.zero?
      @tail = @head = nil
      return
    end

    prev_node = @tail.prev_node
    prev_node.next_node = nil
    @tail.prev_node = nil
    @tail = prev_node
  end
end

# CacheNode class
class CacheNode
  attr_accessor :key, :value, :prev_node, :next_node

  def initialize(key, value, prev_node = nil, next_node = nil)
    @key = key
    @value = value
    @prev_node = prev_node
    @next_node = next_node
  end
end

# Main program
capacity = 1
lru_cache = LRUCache.new(capacity)

# Put node to cache
# lru_cache.put(1, 'one')
# lru_cache.put(2, 'two')
# lru_cache.get(1)
# lru_cache.put(3, 'three')
# lru_cache.get(2)
# lru_cache.put(4, 'four')

# lru_cache.put(1, 'one')
# lru_cache.put(2, 'two')
# lru_cache.get(1)
# lru_cache.put(3, 'three')
# lru_cache.get(1)
# lru_cache.put(4, 'four')
# lru_cache.get(1)

lru_cache.put(2, 'mot')
lru_cache.get(2)
lru_cache.put(3, 'hai')
lru_cache.get(2)
lru_cache.get(3)

# lru_cache.cache_hash.each_key { |key| puts key }
puts lru_cache.head.key
puts lru_cache.tail.key

# param = lru_cache.get(key)
# obj.put(key, value)
