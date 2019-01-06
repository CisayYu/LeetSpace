def my_atoi(str)
  res = str.to_i

  if res < -2**31
    res = -2**31
  end

  if res >= 2**31
    res = 2**31 - 1
  end

  res
end

puts my_atoi "   -42"