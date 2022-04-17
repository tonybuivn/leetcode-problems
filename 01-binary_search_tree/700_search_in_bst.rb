# frozen_string_literal: true

require_relative './tree_node'

# @param {TreeNode} root
# @param {Integer} val
# @return {TreeNode}
def search_bst(root, val)
  return [] if root.nil?

  if val < root.val
    search_bst(root.left, val)
  elsif val > root.val
    search_bst(root.right, val)
  else
    root
  end
end

# Test search_bst
# tree_node = TreeNode.new
# array1 = [4, 2, 7, 1, 3]
# val = 5
# array1.each { |el| tree_node = insert(tree_node, el) }
# node_result = search_bst(tree_node, val)

# puts "[#{node_result.val}, #{node_result.left.val}, #{node_result.right.val}]"
