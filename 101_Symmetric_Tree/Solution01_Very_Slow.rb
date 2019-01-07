# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

# @param {TreeNode} root
# @return {Boolean}

# 检查是否某 level 下的数组，是否是对称的
def is_symmetric_array(array)
  # 当前行为奇数时必然是非对称，除了根节点
  if array.count.odd?
    return false
  end

  low = 0
  high = array.count - 1
  res = true
  # 从数组头尾开始依次检查
  while low < high
    if array[low] != array[high]
      res = false
    end
    low += 1
    high -= 1
  end

  res
end

class Queue
  attr_accessor :queue_array

  def initialize
    @queue_array = []
  end

  def enqueue(node)
    queue_array << node
  end

  def dequeue
    queue_array.delete_at(0)
  end

  def front_item
    queue_array[0]
  end

  def count
    queue_array.count
  end
end

def is_symmetric(root)
  if root.nil?
    return true
  end
  queue = Queue.new
  res = []
  level = 0
  current_level_flag = 0
  current_level_total = 1
  child_level_flag = 0
  queue.enqueue(root)

  # DFS 遍历，入队列
  while queue.count > 0
    if res[level].nil?
      res[level] = []
    end
    res[level] << queue.front_item.val

    if queue.front_item.val == "*"
      current_level_flag += 1
      if current_level_flag >= current_level_total
        current_level_flag = 0
        current_level_total = child_level_flag
        child_level_flag = 0
        level += 1
      end
      queue.dequeue
      next
    end

    if queue.front_item.left
      child_level_flag += 1
      queue.enqueue(queue.front_item.left)
    else
      # 对于空位，需要补齐特殊字符，以便于后面对称性的判断
      child_level_flag += 1
      queue.enqueue(TreeNode.new("*"))
    end

    if queue.front_item.right
      child_level_flag += 1
      queue.enqueue(queue.front_item.right)
    else
      child_level_flag += 1
      queue.enqueue(TreeNode.new("*"))
    end

    current_level_flag += 1
    if current_level_flag >= current_level_total
      current_level_flag = 0
      current_level_total = child_level_flag
      child_level_flag = 0
      level += 1
    end

    queue.dequeue
  end

  is_symme = true
  # 检查是否对称
  res.each_with_index do |value, index|
    if index == 0
      next
    end
    unless is_symmetric_array(value)
      is_symme = false
    end
  end

  is_symme
end

root = TreeNode.new(1)
root.left = TreeNode.new(2)
root.right = TreeNode.new(2)
root.left.right = TreeNode.new(3)
root.right.left = TreeNode.new(3)

puts is_symmetric(root).to_s