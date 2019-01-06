class ListNode
  attr_accessor :val, :next
  def initialize(val)
    @val = val
    @next = nil
  end
end

# 数组生成单链表
def generate_list_node(array)
  pointer = nil
  l1 = nil
  array.each do |v|
    if l1 == nil
      l1 = ListNode.new(v)
      pointer = l1
      next
    end
    temp_list_node = ListNode.new(v)
    pointer.next = temp_list_node
    pointer = temp_list_node
  end
  l1
end

array1 = [9, 9]
array2 = [1]

l1 = generate_list_node(array1)
l2 = generate_list_node(array2)

# 直接进行进位加和计算，
def add_two_numbers(l1, l2)
  p1 = l1
  p2 = l2
  carry = 0
  result_list = nil
  p3 = nil
  while p1 or p2
    n1 = (p1 != nil) ? p1.val : 0
    n2 = (p2 != nil) ? p2.val : 0
    s1 = (n1 + n2 + carry)%10
    if result_list == nil
      result_list = ListNode.new(s1)
      p3 = result_list
    else
      p3.next = ListNode.new(s1)
      p3 = p3.next
    end
    carry = (n1 + n2 + carry)/10
    p1 = p1 ? p1.next : nil
    p2 = p2 ? p2.next : nil
  end

  if carry != 0
    p3.next = ListNode.new(1)
  end

  result_list
end

add_two_numbers(l1, l2)