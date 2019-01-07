# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {TreeNode} root
# @return {Integer}
def max_depth(root)
  res = 0
  if root.nil?
    return res
  end

  if root.left
    res = [res, max_depth(root.left)].max
  end

  if root.right
    res = [res, max_depth(root.right)].max
  end

  res += 1

  res
end

#     3
#   9   20
#      15 7
root = TreeNode.new(3)
root.left = TreeNode.new(9)
root.right = TreeNode.new(20)
root.right.left = TreeNode.new(15)
root.right.right = TreeNode.new(7)

puts max_depth(root).to_s