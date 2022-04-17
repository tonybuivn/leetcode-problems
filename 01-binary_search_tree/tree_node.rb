# frozen_string_literal: true

# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

def insert(root, val)
  return TreeNode.new(val) if root.nil?

  if val < root.val
    root.left = insert(root.left, val)
  elsif val > root.val
    root.right = insert(root.right, val)
  end

  root
end

def print_preorder_dfs(root)
  return unless root

  puts root.val
  print_preorder_dfs(root.left)
  print_preorder_dfs(root.right)
end
