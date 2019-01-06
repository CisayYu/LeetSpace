def find_median_sorted_arrays(nums1, nums2)
  i = 0
  j = 0

  # 确保 nums1 的元素小于等于 nums2
  if nums1.count > nums2.count
    nums0 = nums1
    nums1 = nums2
    nums2 = nums0
  end
  # 两个数组的长度
  l1 = nums1.count
  l2 = nums2.count

  # 其中一个元素为空时，直接取第二个元素中位数返回
  if nums1.empty?
    if l2.even?
      return (nums2[l2/2] + nums2[(l2 / 2) - 1]) / 2.0
    else
      return (nums2[l2/2])
    end
  elsif nums2.empty?
    if l1.even?
      return (nums1[l1/2] + nums1[(l1 / 2) - 1]) / 2.0
    else
      return (nums1[l1/2])
    end
  end

  # i 的下界和上界
  min1 = 0
  max1 = l1
  while min1 <= max1
    # 二分取 i
    i = (min1 + max1)/ 2
    # 由于 i - 1 + j - 1 = l1 - i + l2 - j 或者 i - 1 + j - 1 = l1 - i + l2 - j + 1
    # j = ((l1 + l2 + 1)/2) - i
    j = ((l1 + l2 + 1)/2) - i
    part11 = (i == 0 ? (-Float::INFINITY):nums1[i-1])
    part12 = (j == 0 ? (-Float::INFINITY):nums2[j-1])
    part21 = i == l1 ? Float::INFINITY : nums1[i]
    part22 = j == l2 ? Float::INFINITY : nums2[j]
    if part11 <= part22 and part12 <= part21
      if (l1 + l2).even? # 偶数个元素，算平均值
        return ([part11, part12].max + [part21, part22].min).to_f/2.0
      end
      # 奇数个元素，取中点值
      return [part11, part12].max
    end
    if part11 > part22
      max1 = i - 1
      next
    end
    if part12 > part21
      min1 = i + 1
      next
    end
  end
end

puts find_median_sorted_arrays([1], [1])