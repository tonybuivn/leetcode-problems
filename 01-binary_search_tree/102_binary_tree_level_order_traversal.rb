# frozen_string_literal: true

require_relative './tree_node'
require_relative './144_bst_preorder_traversal'
require 'pry'

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {Integer[][]}
def level_order(root)
  return [[]] if root.nil?

  queue = [root]
  res = []
  until queue.empty?
    level_len = queue.length
    sub_res = []
    level_len.times do
      queue << queue[0].left if queue[0].left != nil
      queue << queue[0].right if queue[0].right != nil
      sub_res << queue[0].val
      queue.shift
    end
    res << sub_res
  end
  res
end

def level_traversal(root)
  queue = []
  res = []
  curr = root
  while curr != nil
    res << curr.val
    queue << curr.left if curr.left != nil
    queue << curr.right if curr.right != nil
    curr = queue.shift
  end
  res
end

# Input: root = [3,9,20,null,null,15,7]
# Output: [[3],[9,20],[15,7]]
# array = [3, 9, 20, nil, nil, 15, 7]
array = [5, 3, 6, 2, 4, 8, 1, 7]
# array = [1, 2, 3, 4, 5]
tree_node = TreeNode.new(array[0])
array.each { |el| tree_node = insert(tree_node, el) }

# preorder_traversal(tree_node).each { |el| puts el }
level_order(tree_node).each { |el| puts el }
