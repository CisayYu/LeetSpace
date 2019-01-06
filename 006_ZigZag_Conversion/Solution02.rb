def convert(s, num_rows)
  str_array = s.split("")

  if str_array.count <= 1 or num_rows <= 1
    return s
  end

  res = num_rows.times.map { "" }
  i = 0
  d = 1
  # 向前遍历到超出num_rows范围时，反向遍历
  # 向后遍历到小于0时，正向遍历
  str_array.each do |value|
    res[i] << value
    i += d
    if i == num_rows
      d = -1
      i -= 2
    elsif i < 0
      d = 1
      i += 2
    end
  end

  res.join
end

puts convert("PAYPALISHIRING", 3)