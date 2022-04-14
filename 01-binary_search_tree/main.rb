# frozen_string_literal: true

require_relative './binary_tree'

array = [4, 2, 7, 1, 3]
val = 5
tree_node = TreeNode.new

def insert(root, val)
  return TreeNode.new(val) if root.nil?

  if val < root.val
    root.left = insert(root.left, val)
  elsif val > root.val
    root.right = insert(root.right, val)
  else
    raise ArgumentError, 'Value already exists in tree'
  end

  root
end

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

array.each { |el| tree_node = insert(tree_node, el) }
node_result = search_bst(tree_node, val)

puts "[#{node_result.val}, #{node_result.left.val}, #{node_result.right.val}]"
